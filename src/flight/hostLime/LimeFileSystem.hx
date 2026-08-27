// Maintained host adapter: Flight file-system backend over sys IO. Upstream's
// default is web OPFS; this backend implements the same `FileSystemBackend`
// seam with `sys.FileSystem`/`sys.io.File`, so filesystem free functions work
// natively. Install with
// `setFileSystemBackend(LimeFileSystem.createLimeFileSystemBackend())`.
// Contract carried over: reads resolve to null/[] and writes to false on
// missing entries or denied access — never a rejection. `isSymlink` is always
// false (sys exposes no portable symlink probe).
package flight.hostLime;

#if (lime && sys)
import Math as HxMath;
import flight._internal._Promise;
import flight._internal._Runtime;
import flight._internal._UInt8Array;
import sys.FileSystem;
import sys.io.File;

class LimeFileSystem {
  /** Allocation entry point, Flight-style: `createLimeFileSystemBackend()`. */
  public static function createLimeFileSystemBackend():flight.types.FileSystemBackend {
    return cast {
      readTextFile: function(path:String):_Promise<Dynamic> {
        return done(try File.getContent(path) catch (_:Dynamic) null);
      },
      writeTextFile: function(path:String, data:String):_Promise<Dynamic> {
        return done(try {
          File.saveContent(path, data);
          true;
        } catch (_:Dynamic) false);
      },
      readBinaryFile: function(path:String):_Promise<Dynamic> {
        return done(try (new _UInt8Array(File.getBytes(path)) : Dynamic) catch (_:Dynamic) null);
      },
      readBinaryFileRange: function(path:String, offset:Float, length:Float):_Promise<Dynamic> {
        return done(try {
          final bytes = File.getBytes(path);
          final from = Std.int(offset);
          if (from >= bytes.length) (new _UInt8Array(0) : Dynamic);
          else {
            final count = Std.int(HxMath.min(length, bytes.length - from));
            (new _UInt8Array(bytes.sub(from, count)) : Dynamic);
          }
        } catch (_:Dynamic) null);
      },
      writeBinaryFile: function(path:String, data:Dynamic):_Promise<Dynamic> {
        return done(try {
          File.saveBytes(path, viewToBytes(data));
          true;
        } catch (_:Dynamic) false);
      },
      writeFileAtomic: function(path:String, data:Dynamic):_Promise<Dynamic> {
        return done(try {
          final temp = path + '.tmp-flight-atomic';
          final bytes = Std.isOfType(data, String) ? haxe.io.Bytes.ofString(cast data) : viewToBytes(data);
          File.saveBytes(temp, bytes);
          if (FileSystem.exists(path)) FileSystem.deleteFile(path);
          FileSystem.rename(temp, path);
          true;
        } catch (_:Dynamic) false);
      },
      fileExists: function(path:String):_Promise<Dynamic> {
        return done(FileSystem.exists(path) && !FileSystem.isDirectory(path));
      },
      directoryExists: function(path:String):_Promise<Dynamic> {
        return done(FileSystem.exists(path) && FileSystem.isDirectory(path));
      },
      removeFile: function(path:String):_Promise<Dynamic> {
        return done(try {
          FileSystem.deleteFile(path);
          true;
        } catch (_:Dynamic) false);
      },
      removeDirectory: function(path:String, recursive:Null<Bool>):_Promise<Dynamic> {
        return done(try {
          if (recursive == true) removeTree(path) else FileSystem.deleteDirectory(path);
          true;
        } catch (_:Dynamic) false);
      },
      makeDirectory: function(path:String):_Promise<Dynamic> {
        return done(try {
          FileSystem.createDirectory(path);
          true;
        } catch (_:Dynamic) false);
      },
      readDirectory: function(path:String):_Promise<Dynamic> {
        return done(try listEntries(path) catch (_:Dynamic) ([] : Array<Dynamic>));
      },
      readDirectoryRecursive: function(path:String, options:Dynamic):_Promise<Dynamic> {
        final maxDepth:Null<Float> = options == null ? null : _Runtime.field(options, 'maxDepth');
        return done(try {
          final out:Array<Dynamic> = [];
          walk(path, 0, maxDepth == null || !HxMath.isFinite(maxDepth) ? -1 : Std.int(maxDepth), out);
          (out : Dynamic);
        } catch (_:Dynamic) ([] : Array<Dynamic>));
      },
      statFile: function(path:String):_Promise<Dynamic> {
        return done(try {
          final stat = FileSystem.stat(path);
          ({
            size: (stat.size : Float),
            isDirectory: FileSystem.isDirectory(path),
            modifiedTime: stat.mtime.getTime(),
            createdTime: stat.ctime.getTime(),
            isSymlink: false,
          } : Dynamic);
        } catch (_:Dynamic) null);
      },
      rename: function(from:String, to:String):_Promise<Dynamic> {
        return done(try {
          FileSystem.rename(from, to);
          true;
        } catch (_:Dynamic) false);
      },
      copy: function(from:String, to:String):_Promise<Dynamic> {
        return done(try {
          File.copy(from, to);
          true;
        } catch (_:Dynamic) false);
      },
      appendTextFile: function(path:String, data:String):_Promise<Dynamic> {
        return done(try {
          final output = File.append(path, false);
          output.writeString(data);
          output.close();
          true;
        } catch (_:Dynamic) false);
      },
      // No native stream emulation yet; null is the contract's unsupported value.
      openFileReadStream: function(_path:String):_Promise<Dynamic> return done(null),
      openFileWriteStream: function(_path:String):_Promise<Dynamic> return done(null),
      // sys exposes no symlink or permission APIs; report unsupported per contract.
      createFileSymlink: function(_target:String, _linkPath:String):_Promise<Dynamic> return done(false),
      readFileSymlink: function(_path:String):_Promise<Dynamic> return done(null),
      getFileRealPath: function(path:String):_Promise<Dynamic> {
        return done(try FileSystem.exists(path) ? FileSystem.fullPath(path) : null catch (_:Dynamic) null);
      },
      getFilePermissions: function(_path:String):_Promise<Dynamic> return done(null),
      setFilePermissions: function(_path:String, _permissions:Dynamic):_Promise<Dynamic> return done(false),
      canAccessFile: function(path:String, mode:String):_Promise<Dynamic> {
        return done(switch (mode) {
          case 'readable': FileSystem.exists(path);
          case 'writable':
            try {
              if (!FileSystem.exists(path)) false;
              else {
                final output = File.append(path, false);
                output.close();
                true;
              }
            } catch (_:Dynamic) false;
          default: false;
        });
      },
      getFileSystemUsage: function():_Promise<Dynamic> return done(null),
      // No native change watcher; return the web-parity no-op unsubscribe.
      watch: function(_path:String, _listener:Dynamic):Dynamic return function():Void {},
      getPath: function(kind:String):String return pathFor(kind),
    };
  }

  static function pathFor(kind:String):String {
    return switch (kind) {
      case 'home': lime.system.System.userDirectory;
      case 'documents': lime.system.System.documentsDirectory;
      case 'desktop': lime.system.System.desktopDirectory;
      case 'downloads': lime.system.System.userDirectory + '/Downloads';
      case 'temp':
        final env = Sys.getEnv('TMPDIR') != null ? Sys.getEnv('TMPDIR') : Sys.getEnv('TEMP');
        env != null ? env : '/tmp';
      case 'cache': lime.system.System.applicationStorageDirectory + '/cache';
      default: lime.system.System.applicationStorageDirectory;
    };
  }

  static inline function done(value:Dynamic):_Promise<Dynamic> {
    return _Promise.resolve(value);
  }

  static function viewToBytes(data:Dynamic):haxe.io.Bytes {
    if (Std.isOfType(data, haxe.io.Bytes)) return cast data;
    final inner:Dynamic = _Runtime.field(data, 'buffer');
    if (inner != null && Std.isOfType(inner, haxe.io.Bytes)) return cast inner;
    throw 'unsupported binary payload';
  }

  static function listEntries(path:String):Array<Dynamic> {
    final base = StringTools.endsWith(path, '/') ? path : path + '/';
    return [
      for (name in FileSystem.readDirectory(path))
        {name: name, path: base + name, isDirectory: FileSystem.isDirectory(base + name)}
    ];
  }

  static function walk(path:String, depth:Int, maxDepth:Int, out:Array<Dynamic>):Void {
    for (entry in listEntries(path)) {
      out.push(entry);
      if (entry.isDirectory && (maxDepth < 0 || depth < maxDepth)) walk(entry.path, depth + 1, maxDepth, out);
    }
  }

  static function removeTree(path:String):Void {
    for (name in FileSystem.readDirectory(path)) {
      final child = path + '/' + name;
      if (FileSystem.isDirectory(child)) removeTree(child) else FileSystem.deleteFile(child);
    }
    FileSystem.deleteDirectory(path);
  }
}
#end
