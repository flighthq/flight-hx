package flight_hx;

#if macro
import haxe.io.Path;
import haxe.macro.Compiler;
import haxe.macro.Context;

// Flight owns the complete target dispatch. Keep legacy roots off the classpath so a missing
// generated declaration cannot accidentally resolve to an old Haxe implementation or C++ adapter.
class Package {
  static var configured = false;

  public static function configure():Void {
    if (configured) return;
    configured = true;

    final macroFile = sys.FileSystem.fullPath(Context.resolvePath('flight_hx/Package.hx'));
    final root = sys.FileSystem.fullPath(Path.normalize(Path.join([Path.directory(macroFile), '..', '..'])));
    if (Context.defined('flight_hx')) {
      Context.fatalError('flight_hx implementation sources have been retired; use native FFI (cpp/hl) or JS with flight_esm.', Context.currentPos());
    }
    if (Context.defined('js') && !Context.defined('flight_esm')) {
      Context.fatalError('Flight on JS requires flight_esm and an ESM build pipeline.', Context.currentPos());
    }
    if (!Context.defined('cpp') && !Context.defined('hl') && !Context.defined('js')) {
      Context.fatalError('Flight has no backend for this target; use cpp, hl, or JS with flight_esm.', Context.currentPos());
    }
    final generated = Path.join([root, 'generated', 'externs']);
    if (!sys.FileSystem.exists(Path.join([generated, 'provenance.json']))) {
      Context.fatalError('Flight Rust externs are missing; run npm run generate:externs before packaging.', Context.currentPos());
    }
    Compiler.addClassPath(generated);
    if (Context.defined('js')) Compiler.addClassPath(Path.join([root, 'tools', 'esm']));
    else Native.configure(root);
  }
}
#end
