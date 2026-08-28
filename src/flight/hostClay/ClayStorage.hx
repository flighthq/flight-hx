// Maintained host adapter: Flight storage backend for the Clay host.
// Clay counterpart of flight.hostLime.LimeStorage. SKELETON: an in-memory map
// so the seam is installable and functional within a session; persistence is
// the fill-in — a write-through file via Clay's IO, matching LimeStorage's
// JSON-file backend and UTF-16 byteSize accounting.
package flight.hostClay;

#if clay
import flight.types.StorageBackend;

class ClayStorage {
  /** Allocation entry point, Flight-style: `createClayStorageBackend()`. */
  public static function createClayStorageBackend(?_path:String):StorageBackend {
    final store = new Map<String, String>();
    return cast {
      getItem: function(key:String):Null<String> return store.exists(key) ? store.get(key) : null,
      setItem: function(key:String, value:String):Bool {
        store.set(key, value);
        return true; // TODO(hostClay): persist via Clay IO + report quota like LimeStorage.
      },
      removeItem: function(key:String):Void store.remove(key),
      clear: function():Void store.clear(),
    };
  }
}
#end
