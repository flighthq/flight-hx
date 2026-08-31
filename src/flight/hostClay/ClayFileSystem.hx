// Maintained host adapter: Flight filesystem backend for the Clay host.
// Clay counterpart of flight.hostLime.LimeFileSystem. Real core implemented over
// Haxe sys.io on native (Clay native is a sys target); sentinel for operations
// not portably available. WRITE-AHEAD refinement against develop seams — the
// async Promise-returning shape matches LimeFileSystem. See host-develop-adaptation.md.
package flight.hostClay;

#if clay
import flight.types.FileSystemHostBackend;
import flight._internal._Promise;

class ClayFileSystem {
  /** Allocation entry point, Flight-style: `createClayFileSystemBackend()`. */
  public static function createClayFileSystemBackend():flight.types.FileSystemHostBackend {
    final backend:Dynamic = ({} : Dynamic);
    #if sys
    backend.readTextFile = function(path:String):_Promise<Dynamic>
      return done(try sys.io.File.getContent(path) catch (_:Dynamic) null);
    backend.writeTextFile = function(path:String, data:String):_Promise<Dynamic>
      return done(try { sys.io.File.saveContent(path, data); true; } catch (_:Dynamic) false);
    backend.readFile = function(path:String):_Promise<Dynamic>
      return done(try sys.io.File.getBytes(path) catch (_:Dynamic) null);
    backend.writeFile = function(path:String, data:Dynamic):_Promise<Dynamic>
      return done(try { sys.io.File.saveBytes(path, cast data); true; } catch (_:Dynamic) false);
    backend.writeFileAtomic = function(path:String, data:Dynamic):_Promise<Dynamic>
      return done(try {
        final tmp = path + '.tmp-' + Std.int(haxe.io.Bytes.alloc(1).get(0)); // best-effort temp
        sys.io.File.saveBytes(tmp, cast data);
        sys.FileSystem.rename(tmp, path);
        true;
      } catch (_:Dynamic) false);
    backend.exists = function(path:String):_Promise<Dynamic>
      return done(try sys.FileSystem.exists(path) catch (_:Dynamic) false);
    backend.deleteFile = function(path:String):_Promise<Dynamic>
      return done(try { sys.FileSystem.deleteFile(path); true; } catch (_:Dynamic) false);
    backend.createDirectory = function(path:String):_Promise<Dynamic>
      return done(try { sys.FileSystem.createDirectory(path); true; } catch (_:Dynamic) false);
    backend.readDirectory = function(path:String):_Promise<Dynamic>
      return done(try sys.FileSystem.readDirectory(path) catch (_:Dynamic) ([] : Array<Dynamic>));
    // TODO(develop): streams, symlinks, POSIX perms, disk-usage — sentinel like LimeFileSystem.
    #end
    return cast backend;
  }

  static inline function done(v:Dynamic):_Promise<Dynamic> return _Promise.resolve(v);
}
#end
