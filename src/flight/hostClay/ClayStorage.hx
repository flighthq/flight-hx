// Maintained host adapter: Flight storage backend for the Clay host.
// Clay counterpart of flight.hostLime.LimeStorage. Write-through JSON persistence
// over sys.io on native (matching LimeStorage's atomic-JSON model); in-memory
// only off-sys. See agents/host-develop-adaptation.md.
package flight.hostClay;

#if clay
import flight.types.StorageBackend;

class ClayStorage {
  /** Allocation entry point, Flight-style: `createClayStorageBackend()`. */
  public static function createClayStorageBackend(?path:String):StorageBackend {
    final file = path == null ? 'flight-storage.json' : path;
    final store = load(file);
    // The upstream StorageBackend seam returns union results: success is
    // { reason: 'ok' } (plus `value` for reads). Clay's write-through is
    // best-effort, so mutations report success optimistically.
    return cast {
      getItem: function(key:String):Dynamic return {reason: 'ok', value: store.exists(key) ? store.get(key) : null},
      setItem: function(key:String, value:String):Dynamic {
        store.set(key, value);
        persist(file, store);
        return {reason: 'ok'};
      },
      removeItem: function(key:String):Dynamic {
        store.remove(key);
        persist(file, store);
        return {reason: 'ok'};
      },
      clear: function():Dynamic {
        store.clear();
        persist(file, store);
        return {reason: 'ok'};
      },
      keys: function():Dynamic return {reason: 'ok', value: [for (k in store.keys()) k]},
    };
  }

  static function load(file:String):Map<String, String> {
    final m = new Map<String, String>();
    #if sys
    try {
      if (sys.FileSystem.exists(file)) {
        final obj:Dynamic = haxe.Json.parse(sys.io.File.getContent(file));
        for (k in Reflect.fields(obj)) m.set(k, Std.string(Reflect.field(obj, k)));
      }
    } catch (_:Dynamic) {}
    #end
    return m;
  }

  static function persist(file:String, store:Map<String, String>):Void {
    #if sys
    try {
      final obj:Dynamic = {};
      for (k in store.keys()) Reflect.setField(obj, k, store.get(k));
      final tmp = file + '.tmp';
      sys.io.File.saveContent(tmp, haxe.Json.stringify(obj));
      sys.FileSystem.rename(tmp, file); // atomic write-through
    } catch (_:Dynamic) {}
    #end
  }
}
#end
