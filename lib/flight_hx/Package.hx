package flight_hx;

#if macro
import haxe.io.Path;
import haxe.macro.Compiler;
import haxe.macro.Context;

// Haxelib exposes one static classPath, while Flight deliberately has target-specific generated
// roots. This initialization macro elects exactly one backend root and keeps its precedence over
// the common maintained/generated roots. Direct repository builds may continue to spell the same
// classpaths explicitly; installed consumers only need `-lib flight` and their pipeline define.
class Package {
  static var configured = false;

  public static function configure():Void {
    if (configured) return;
    configured = true;

    final macroFile = Context.resolvePath('flight_hx/Package.hx');
    final root = Path.normalize(Path.join([Path.directory(macroFile), '..', '..']));
    Compiler.addClassPath(Path.join([root, 'src']));
    Compiler.addClassPath(Path.join([root, 'generated']));

    if (Context.defined('flight_hx')) {
      Compiler.addClassPath(Path.join([root, 'generated', 'hx']));
    } else if (Context.defined('js') && Context.defined('flight_esm')) {
      Compiler.addClassPath(Path.join([root, 'generated', 'js']));
      Compiler.addClassPath(Path.join([root, 'tools', 'esm']));
    } else if (Context.defined('cpp')) {
      Compiler.addClassPath(Path.join([root, 'src-cpp']));
      Compiler.define('HXCPP_NO_CPP11');
      Compiler.define('flight_hx_root', root);
    }
  }
}
#end
