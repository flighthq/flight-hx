// Maintained runtime support for generated Flight Haxe.
package flighthq._internal;

/**
 * Portable stand-in for the JavaScript `WeakMap`, keyed by object identity.
 * JavaScript targets construct the native `WeakMap` instead (see
 * `_Runtime.globalValue`), so this class only serves the other targets, where
 * entries are held strongly: Flight removes entries explicitly, and weakness is
 * a collector nicety rather than observable semantics.
 */
// Constructed through `_Runtime` and used as the typed receiver surface for
// generated WeakMap operations.
@:keep
class _WeakMap {
  final entries:haxe.ds.ObjectMap<{}, Dynamic> = new haxe.ds.ObjectMap();

  public function new(?source:Dynamic) {
    if (source != null) for (pair in (cast source : Array<Dynamic>)) set(pair[0], pair[1]);
  }

  #if js
  @:native("delete")
  #end
  public function delete_(key:Dynamic):Bool {
    return key != null && entries.remove(cast key);
  }

  public function get(key:Dynamic):Dynamic {
    return key == null ? null : entries.get(cast key);
  }

  public function has(key:Dynamic):Bool {
    return key != null && entries.exists(cast key);
  }

  public function set(key:Dynamic, value:Dynamic):_WeakMap {
    entries.set(cast key, value);
    return this;
  }
}
