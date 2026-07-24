package flighthq._internal;

#if macro
import haxe.macro.Context;
import haxe.macro.Expr;
#end

/**
 * Compile-time target boundary for generated WebGL2 context access.
 *
 * Generated code deliberately retains literal WebGL method and constant names
 * at this boundary. The macros expand those literals to direct Lime GL-context
 * calls or Haxe HTML WebGL2 extern calls. No reflective property lookup remains
 * in the compiled target, and Haxe can eliminate every unused binding.
 */
class WebGl2RenderingContext {
  public static macro function call(context:Expr, name:Expr, arguments:Expr):Expr {
    final binding = literalName(name);
    final values = arrayValues(arguments);
    return targetCall(context, binding, values, name.pos);
  }

  public static macro function callOptional(context:Expr, name:Expr, arguments:Expr):Expr {
    final binding = literalName(name);
    final values = arrayValues(arguments);
    final invoked = targetCall(context, binding, values, name.pos);
    return macro $context == null ? flighthq._internal._Runtime.UNDEFINED : $invoked;
  }

  public static macro function field(context:Expr, name:Expr):Expr {
    final binding = literalName(name);
    return targetField(context, binding, name.pos);
  }

  public static macro function setField(context:Expr, name:Expr, value:Expr):Expr {
    Context.error('WebGL2 properties are read-only bindings; cannot assign ' + literalName(name), name.pos);
    return value;
  }

  public static macro function deleteField(context:Expr, name:Expr):Expr {
    Context.error('WebGL2 bindings cannot be deleted: ' + literalName(name), name.pos);
    return macro false;
  }

  #if macro
  static function literalName(expression:Expr):String {
    return switch (expression.expr) {
      case EConst(CString(value, _)): value;
      case EParenthesis(inner) | EMeta(_, inner): literalName(inner);
      default:
        Context.error('WebGL2 binding names must be string literals', expression.pos);
    };
  }

  static function arrayValues(expression:Expr):Array<Expr> {
    return switch (expression.expr) {
      case EArrayDecl(values): values;
      case ECast(inner, _) | ECheckType(inner, _) | EParenthesis(inner) | EMeta(_, inner): arrayValues(inner);
      default:
        Context.error('WebGL2 binding arguments must be a literal array', expression.pos);
    };
  }

  static function targetCall(context:Expr, name:String, arguments:Array<Expr>, position:Position):Expr {
    if (Context.defined('lime') && !Context.defined('js')) {
      final target = castTarget(context, ['lime', 'graphics'], 'WebGL2RenderContext');
      return untypedCall(target, name, arguments, position);
    }
    if (Context.defined('js') && Context.defined('html5')) {
      final target = castTarget(context, ['js', 'html', 'webgl'], 'WebGL2RenderingContext');
      return untypedCall(target, name, arguments, position);
    }
    // GL packages remain type-checkable on portable/headless targets. They have
    // no context to invoke, matching the maintained runtime's other host
    // sentinels; actual rendering requires one of the typed branches above.
    return macro null;
  }

  static function targetField(context:Expr, name:String, position:Position):Expr {
    final target =
      if (Context.defined('lime') && !Context.defined('js')) {
        castTarget(context, ['lime', 'graphics'], 'WebGL2RenderContext');
      } else if (Context.defined('js') && Context.defined('html5')) {
        macro js.html.webgl.WebGL2RenderingContext;
      } else {
        return macro 0;
      };
    return {
      expr: EUntyped({
        expr: EField(target, name),
        pos: position,
      }),
      pos: position,
    };
  }

  static function castTarget(context:Expr, pack:Array<String>, name:String):Expr {
    return {
      expr: ECast(context, TPath({
        name: name,
        pack: pack,
        params: [],
      })),
      pos: context.pos,
    };
  }

  static function untypedCall(target:Expr, name:String, arguments:Array<Expr>, position:Position):Expr {
    return {
      expr: EUntyped({
        expr: ECall({
          expr: EField(target, name),
          pos: position,
        }, arguments),
        pos: position,
      }),
      pos: position,
    };
  }
  #end
}
