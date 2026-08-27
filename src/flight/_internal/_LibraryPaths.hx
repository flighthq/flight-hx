// Maintained runtime support for generated Flight Haxe.
package flight._internal;

#if macro
import haxe.io.Path;
import haxe.macro.Compiler;
import haxe.macro.Context;
import sys.FileSystem;

/**
 * Init macro invoked from `extraParams.hxml` (`--macro
 * flight._internal._LibraryPaths.run()`).
 *
 * Haxelib exposes exactly one declared classpath (`src`), but a checkout of
 * this repository keeps its generated tree beside it in `generated/`. The two
 * package roots cannot be merged under a single `-cp`, and relative `-cp`
 * lines in `extraParams.hxml` resolve against the consumer's working
 * directory, not the library root. This macro instead locates the library
 * root from its own resolvable source position and registers the sibling
 * `generated/` classpath absolutely, which makes `haxelib git`/`haxelib dev`
 * checkouts consumable as-is. In the packaged release layout the trees are
 * already merged into one classpath and no `generated/` sibling exists, so
 * the macro is a no-op there.
 */
class _LibraryPaths {
  public static function run():Void {
    final own = FileSystem.absolutePath(Context.resolvePath('flight/_internal/_LibraryPaths.hx'));
    final sourceRoot = Path.directory(Path.directory(Path.directory(own)));
    final generated = Path.join([Path.directory(sourceRoot), 'generated']);
    if (FileSystem.exists(generated) && FileSystem.isDirectory(generated)) {
      Compiler.addClassPath(generated);
    }
  }
}
#end
