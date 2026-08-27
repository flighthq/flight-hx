// Maintained runtime support for generated Flight Haxe.
package flight._internal;

// Constructed through `_Runtime` and used as the typed receiver surface for
// generated Map operations.
@:keep
class _Map<K, V> {
  private final items:Array<{key:K, value:V}> = [];

  public var size(default, null):Int = 0;

  public function new(?source:Dynamic) {
    if (source != null) for (pair in (cast source : Array<Dynamic>)) set(pair[0], pair[1]);
  }

  public function clear():Void {
    items.resize(0);
    size = 0;
  }

  #if js
  @:native("delete")
  #end
  public function delete_(key:K):Bool {
    final index = indexOf(key);
    if (index < 0) return false;
    items.splice(index, 1);
    size = items.length;
    return true;
  }

  public function entries():Array<Array<Dynamic>> return [for (item in items) [item.key, item.value]];

  public function forEach(callback:Dynamic):Void {
    for (item in items) _Runtime.callValue(callback, [item.value, item.key, this]);
  }

  public function get(key:K):Null<V> {
    final index = indexOf(key);
    return index < 0 ? null : items[index].value;
  }

  public function has(key:K):Bool return indexOf(key) >= 0;

  private function indexOf(key:K):Int {
    for (index in 0...items.length) if (items[index].key == key) return index;
    return -1;
  }

  public function iterator():Iterator<Array<Dynamic>> return entries().iterator();

  public function keys():Array<K> return [for (item in items) item.key];

  public function set(key:K, value:V):_Map<K, V> {
    final index = indexOf(key);
    if (index < 0) items.push({key: key, value: value}); else items[index].value = value;
    size = items.length;
    return this;
  }

  public function values():Array<V> return [for (item in items) item.value];
}
