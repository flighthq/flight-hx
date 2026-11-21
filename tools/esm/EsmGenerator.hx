package;

import haxe.macro.Type;
import haxe.macro.Compiler;
import haxe.macro.Context;

using Lambda;

// Vendored, purpose-built ESM generator (genes is the reference, not a fork). It is a custom Haxe JS
// generator scoped to this repo's binding vocabulary: it reuses the compiler's own expression codegen
// (JSGenApi.generateValue/generateStatement) and only owns module structure — declared package
// objects (ESM is strict-mode) and, the whole point, turning `@:jsImport("pkg")` externs into hoisted
// static `import * as alias from "pkg"` with the type accessor pointing at the alias. All uses are
// static member accesses (alias.addVector2), which a bundler tree-shakes — so pay-per-use survives,
// unlike Haxe's default `require()` namespace pull-in.
//
// Fail-loud discipline (per Flight): a construct outside the scoped vocabulary is an error, never a
// silent miscompile.
class EsmGenerator {
  final api:haxe.macro.JSGenApi;
  final es6:Bool;
  final buf = new StringBuf();
  final imports = new Map<String, String>(); // module specifier -> import alias
  final externModule = new Map<String, {specifier:String, member:Null<String>}>();
  final inits:Array<TypedExpr> = [];
  final staticInits:Array<{c:ClassType, f:ClassField}> = [];

  public function new(api) {
    this.api = api;
    es6 = Std.parseInt(Context.definedValue('js-es') ?? '5') >= 6;
    // Pre-pass: map every compiler @:jsImport extern (plus legacy @:jsRequire output) to an import
    // alias so the type accessor can resolve it.
    for (t in api.types) switch (t) {
      case TInst(ref, _):
        final c = ref.get();
        if (c.isExtern && (c.meta.has(':jsImport') || c.meta.has(':jsRequire'))) registerImport(c);
      default:
    }
    api.setTypeAccessor(getType);
  }

  function registerImport(c:ClassType) {
    final metadataName = c.meta.has(':jsImport') ? ':jsImport' : ':jsRequire';
    final meta = c.meta.extract(metadataName)[0];
    final binding = switch (meta.params) {
      case [{expr: EConst(CString(specifier))}]: {specifier: specifier, member: null};
      case [{expr: EConst(CString(specifier))}, {expr: EConst(CString(member))}]:
        {specifier: specifier, member: member};
      default: fail(c, '$metadataName needs a string module and an optional string export name');
    };
    if (!imports.exists(binding.specifier)) imports.set(binding.specifier, 'flight_esm_' + imports.count());
    externModule.set(getPath(c), binding);
  }

  // A type reference resolves to its import alias (extern @:jsImport/@:jsRequire) or a flat `var`
  // binding. Flat bindings (not nested package-object mutation) are what let the bundler drop the
  // unused ones — the whole basis of pay-per-use survival.
  function getType(t:Type):String {
    return switch (t) {
      case TInst(c, _): classAccessor(c.get());
      case TEnum(e, _): { final e2 = e.get(); e2.isExtern ? nativeName(e2) : flatName(getPath(e2)); };
      case TAbstract(a, _): flatName(getPath(a.get()));
      default: throw 'unsupported type accessor: $t';
    };
  }

  function classAccessor(c:ClassType):String {
    final path = getPath(c);
    final binding = externModule.get(path);
    if (binding != null) {
      final alias = imports.get(binding.specifier);
      return binding.member == null ? alias : '$alias[${api.quoteString(binding.member)}]';
    }
    if (c.isExtern) return nativeName(c); // native global (Error, Math, ...) — never flattened, never a var
    return flatName(path); // our own class -> flat top-level binding (bundler can DCE it)
  }

  // The real JS name of a native extern: its @:native, else its bare path (globals like Error/Math).
  function nativeName(t:BaseType):String {
    final native = t.meta.extract(':native')[0];
    if (native != null) switch (native.params) { case [{expr: EConst(CString(s))}]: return s; default: }
    return getPath(t);
  }

  inline function print(s:String) buf.add(s);
  inline function newline() buf.add(';\n');
  inline function genExpr(e:TypedExpr) print(api.generateValue(e));
  function field(p:String) return api.isKeyword(p) ? '["$p"]' : '.$p';
  function getPath(t:BaseType):String return t.pack.length == 0 ? t.name : t.pack.join('.') + '.' + t.name;
  function flatName(path:String):String return '$$' + ~/[^A-Za-z0-9_]/g.replace(path, '_');
  function fail(c:ClassType, why:String):Dynamic { Context.error('EsmGenerator: $why', c.pos); return null; }

  function isMethod(f:ClassField):Bool {
    return switch (f.kind) { case FMethod(_): true; default: false; };
  }

  function writeStaticField(p:String, f:ClassField) {
    // Haxe prefixes these constructor properties except when using ES6 methods.
    // Our constructors are functions, so those methods need their own descriptors.
    final reserved = f.name == 'length' || f.name == 'name';
    final defineProperty = reserved && es6 && isMethod(f);
    if (defineProperty) {
      print('Object.defineProperty($p, ${api.quoteString(f.name)}, {configurable: true, writable: true, value: ');
    } else {
      final name = reserved ? '$$' + f.name : f.name;
      print('$p${field(name)} = ');
    }
    final e = f.expr();
    if (e == null) print('null'); else genExpr(e);
    if (defineProperty) print('})');
    newline();
  }

  function genStaticField(c:ClassType, p:String, f:ClassField) {
    if (f.expr() == null || isMethod(f)) writeStaticField(p, f);
    else staticInits.push({c: c, f: f});
  }

  function genClassField(c:ClassType, p:String, f:ClassField) {
    final fn = field(f.name);
    print('$p.prototype$fn = ');
    final e = f.expr();
    if (e == null) print('null'); else genExpr(e);
    newline();
  }

  function genClass(c:ClassType) {
    api.setCurrentClass(c);
    final dotted = getPath(c);
    final p = flatName(dotted);
    // `/* @__PURE__ */` marks the constructor evaluation side-effect-free, so the bundler may drop
    // this whole binding (and its static assignments below) when nothing references `p`.
    print('var $p = $$hxClasses["$dotted"] = /* @__PURE__ */ (');
    if (c.constructor != null) genExpr(c.constructor.get().expr()); else print('function() { }');
    print(')');
    newline();
    print('$p.__name__ = "$dotted"'); newline();
    if (c.superClass != null) {
      final sup = classAccessor(c.superClass.t.get());
      print('$p.__super__ = $sup'); newline();
      print('$p.prototype = Object.create($sup.prototype)'); newline();
      print('$p.prototype.constructor = $p'); newline();
    }
    for (f in c.statics.get()) genStaticField(c, p, f);
    for (f in c.fields.get()) {
      switch (f.kind) { case FVar(AccResolve, _): continue; default: }
      genClassField(c, p, f);
    }
    print('$p.prototype.__class__ = $p'); newline();
  }

  function genEnum(e:EnumType) {
    final dotted = getPath(e);
    final p = flatName(dotted);
    final constructs = e.names.map(api.quoteString).join(',');
    print('var $p = $$hxClasses["$dotted"] = { __ename__ : "$dotted", __constructs__ : [$constructs] }'); newline();
    for (key in e.constructs.keys()) {
      final ctor = e.constructs.get(key);
      final f = field(ctor.name);
      print('$p$f = ');
      switch (ctor.type) {
        case TFun(args, _):
          final sargs = args.map(a -> a.name).join(',');
          print('function($sargs) { var $$x = ["${ctor.name}",${ctor.index},$sargs]; $$x.__enum__ = $p; $$x.toString = $$estr; return $$x; }');
        default:
          print('["' + ctor.name + '",' + ctor.index + ']'); newline();
          print('$p$f.toString = $$estr'); newline();
          print('$p$f.__enum__ = $p');
      }
      newline();
    }
  }

  function genType(t:Type) {
    switch (t) {
      case TInst(ref, _):
        final c = ref.get();
        if (c.init != null) inits.push(c.init);
        if (!c.isExtern) genClass(c);
      case TEnum(ref, _):
        final e = ref.get();
        if (!e.isExtern) genEnum(e);
      default:
    }
  }

  function isArrayIterator(type:Type):Bool {
    return switch type {
      case TInst(reference, _): getPath(reference.get()) == 'haxe.iterators.ArrayIterator';
      default: false;
    };
  }

  public function generate() {
    // Hoisted static ESM imports — the tree-shakeable replacement for require().
    for (specifier => alias in imports) print('import * as $alias from "$specifier";\n');
    // Minimal ESM-strict runtime scaffolding (declared, not global).
    if (api.hasFeature('js.Lib.global') || api.hasFeature('$$global.$$haxeUID')) {
      print('var $$global = globalThis'); newline();
      if (api.hasFeature('$$global.$$haxeUID')) {
        print('$$global.$$haxeUID |= 0'); newline();
      }
    }
    if (api.types.exists(isArrayIterator)) {
      final arrayIterator = flatName('haxe.iterators.ArrayIterator');
      print('function $$getIterator(value) { return value instanceof Array ? new $arrayIterator(value) : value.iterator(); }');
      newline();
    }
    print('var $$hxClasses = {}');newline();
    print('var $$estr = function() { return ${flatName("js.Boot")}.__string_rec(this,""); }'); newline();
    for (t in api.types) genType(t);
    for (e in inits) { print(api.generateStatement(e)); newline(); }
    for (s in staticInits) writeStaticField(flatName(getPath(s.c)), s.f);
    if (api.main != null) { genExpr(api.main); newline(); }
    sys.io.File.saveContent(api.outputFile, buf.toString());
  }

  #if macro
  public static function use() {
    Compiler.setCustomJSGenerator(api -> new EsmGenerator(api).generate());
  }
  #end
}
