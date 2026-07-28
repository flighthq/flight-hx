// Maintained runtime support for generated Flight Haxe.
package flighthq._internal;

/**
 * Portable stand-in for the JavaScript `WeakSet`, keyed by object identity.
 * JavaScript targets construct the native `WeakSet` instead (see
 * `_Runtime.globalValue`); entries are held strongly on the other targets.
 */
// Constructed through `_Runtime` and used as the typed receiver surface for
// generated WeakSet operations.
@:keep
class _WeakSet {
  final entries:haxe.ds.ObjectMap<{}, Bool> = new haxe.ds.ObjectMap();

  public function new(?source:Dynamic) {
    if (source != null) for (value in (cast source : Array<Dynamic>)) add(value);
  }

  public function add(value:Dynamic):_WeakSet {
    entries.set(cast value, true);
    return this;
  }

  #if js
  @:native("delete")
  #end
  public function delete_(value:Dynamic):Bool {
    return value != null && entries.remove(cast value);
  }

  public function has(value:Dynamic):Bool {
    return value != null && entries.exists(cast value);
  }
}
