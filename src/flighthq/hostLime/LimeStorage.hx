// Maintained host adapter: Flight storage backend over a JSON file in the
// application storage directory. Upstream's default is web localStorage; this
// backend implements the same synchronous `StorageBackend` seam with a
// write-through file store. Install with
// `setStorageBackend(LimeStorage.createLimeStorageBackend())`; pass a path to
// override the default `<applicationStorageDirectory>/flight-storage.json`.
// `byteSize` reports the UTF-16 byte cost like the web backend. The optional
// `subscribeChanges` seam is deliberately absent — a single-process file store
// observes no external mutations.
package flighthq.hostLime;

#if (lime && sys)
class LimeStorage {
  /** Allocation entry point, Flight-style: `createLimeStorageBackend()`. */
  public static function createLimeStorageBackend(?path:String):flighthq.types.Storage.StorageBackend {
    final store = new LimeStorageStore(path);
    return cast {
      getItem: function(key:String):Null<String> return store.get(key),
      setItem: function(key:String, value:String):Bool return store.set(key, value),
      removeItem: function(key:String):Bool return store.remove(key),
      clear: function():Bool return store.clear(),
      keys: function():Array<String> return store.keys(),
      byteSize: function():Float return store.byteSize(),
    };
  }
}

private class LimeStorageStore {
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
    return try {
      final out:Dynamic = {};
      for (key => value in load()) Reflect.setField(out, key, value);
      final directory = haxe.io.Path.directory(path);
      if (directory != '' && !sys.FileSystem.exists(directory)) sys.FileSystem.createDirectory(directory);
      sys.io.File.saveContent(path, haxe.Json.stringify(out));
      true;
    } catch (_:Dynamic) false;
  }

  public function get(key:String):Null<String> {
    return load().get(key);
  }

  public function set(key:String, value:String):Bool {
    load().set(key, value);
    return persist();
  }

  public function remove(key:String):Bool {
    load().remove(key);
    return persist();
  }

  public function clear():Bool {
    entries = new Map();
    return persist();
  }

  public function keys():Array<String> {
    return [for (key in load().keys()) key];
  }

  public function byteSize():Float {
    var total = 0.0;
    for (key => value in load()) total += (key.length + value.length) * 2;
    return total;
  }
}
#end
