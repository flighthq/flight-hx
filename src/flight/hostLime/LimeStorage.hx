// Maintained host adapter: Flight storage backend over a JSON file in the
// application storage directory. Upstream's default is web localStorage; this
// backend implements the same synchronous `StorageBackend` seam with a
// atomic write-through file store. HostLime owns default installation; pass a path to
// override the default `<applicationStorageDirectory>/flight-storage.json`.
// `byteSize` reports the UTF-16 byte cost like the web backend. The optional
// `subscribeChanges` seam is deliberately absent — a single-process file store
// observes no external mutations.
package flight.hostLime;

#if (lime && sys)
class LimeStorage {
  /** Allocation entry point, Flight-style: `createLimeStorageBackend()`. */
  public static function createLimeStorageBackend(?path:String):flight.types.StorageBackend {
    final store = new LimeStorageStore(path);
    // The upstream StorageBackend seam returns union results: success is
    // { reason: 'ok' } (plus `value` for reads), a failure carries a non-'ok'
    // reason. A single-process file store only fails on persistence denial.
    return cast {
      getItem: function(key:String):Dynamic return {reason: 'ok', value: store.get(key)},
      setItem: function(key:String, value:String):Dynamic {
        return store.set(key, value) ? {reason: 'ok'} : {reason: 'storage-unavailable'};
      },
      removeItem: function(key:String):Dynamic {
        return store.remove(key) ? {reason: 'ok'} : {reason: 'storage-unavailable'};
      },
      clear: function():Dynamic return store.clear() ? {reason: 'ok'} : {reason: 'storage-unavailable'},
      keys: function():Dynamic return {reason: 'ok', value: store.keys()},
    };
  }
}

private class LimeStorageStore {
  static var persistCounter = 0;
  final path:String;
  var entries:Null<Map<String, String>> = null;

  public function new(?path:String) {
    this.path = path != null ? path : defaultPath();
  }

  static function defaultPath():String {
    final directory = lime.system.System.applicationStorageDirectory;
    return (directory == null ? '.' : directory) + '/flight-storage.json';
  }

  function load():Map<String, String> {
    if (entries != null) return entries;
    entries = new Map();
    try {
      final raw:Dynamic = haxe.Json.parse(sys.io.File.getContent(path));
      for (key in Reflect.fields(raw)) entries.set(key, Std.string(Reflect.field(raw, key)));
    } catch (_:Dynamic) {}
    return entries;
  }

  function persist():Bool {
    final suffix = Std.string(lime.system.System.getTimer()) + '-' + Std.string(persistCounter++);
    final temp = path + '.tmp-flight-' + suffix;
    final backup = path + '.bak-flight-' + suffix;
    var movedOriginal = false;
    return try {
      final out:Dynamic = {};
      for (key => value in load()) Reflect.setField(out, key, value);
      final directory = haxe.io.Path.directory(path);
      if (directory != '' && !sys.FileSystem.exists(directory)) sys.FileSystem.createDirectory(directory);
      sys.io.File.saveContent(temp, haxe.Json.stringify(out));
      #if windows
      if (sys.FileSystem.exists(path)) {
        sys.FileSystem.rename(path, backup);
        movedOriginal = true;
      }
      #end
      sys.FileSystem.rename(temp, path);
      #if windows
      // Replacement already committed; backup cleanup cannot turn it back
      // into a failed mutation without desynchronizing memory from disk.
      if (movedOriginal && sys.FileSystem.exists(backup)) {
        try sys.FileSystem.deleteFile(backup) catch (_:Dynamic) {}
      }
      #end
      true;
    } catch (_:Dynamic) {
      try if (sys.FileSystem.exists(temp)) sys.FileSystem.deleteFile(temp) catch (_:Dynamic) {}
      #if windows
      if (movedOriginal && !sys.FileSystem.exists(path)) {
        try sys.FileSystem.rename(backup, path) catch (_:Dynamic) {}
      }
      #end
      false;
    };
  }

  public function get(key:String):Null<String> {
    return load().get(key);
  }

  public function set(key:String, value:String):Bool {
    final values = load();
    final existed = values.exists(key);
    final previous = values.get(key);
    values.set(key, value);
    if (persist()) return true;
    if (existed) values.set(key, previous) else values.remove(key);
    return false;
  }

  public function remove(key:String):Bool {
    final values = load();
    if (!values.exists(key)) return true;
    final previous = values.get(key);
    values.remove(key);
    if (persist()) return true;
    values.set(key, previous);
    return false;
  }

  public function clear():Bool {
    final previous = entries == null ? copy(load()) : copy(entries);
    entries = new Map();
    if (persist()) return true;
    entries = previous;
    return false;
  }

  public function keys():Array<String> {
    return [for (key in load().keys()) key];
  }

  public function byteSize():Float {
    var total = 0.0;
    for (key => value in load()) total += (key.length + value.length) * 2;
    return total;
  }

  static function copy(source:Map<String, String>):Map<String, String> {
    final result = new Map();
    for (key => value in source) result.set(key, value);
    return result;
  }
}
#end
