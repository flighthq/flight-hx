// Maintained runtime support for generated Flight Haxe.
package flighthq._internal;

/**
 * Portable stand-in for the JavaScript `WeakSet`, keyed by object identity.
 * JavaScript targets construct the native `WeakSet` instead (see
 * `_Runtime.globalValue`); entries are held strongly on the other targets.
 */
// Reached only reflectively (constructed through `_Runtime.globalValue`), so
// full dead-code elimination must not strip the class or its members.
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

  public function delete_(value:Dynamic):Bool {
    return value != null && entries.remove(cast value);
  }

  public function has(value:Dynamic):Bool {
    return value != null && entries.exists(cast value);
  }
}
