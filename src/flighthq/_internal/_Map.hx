// Maintained runtime support for generated Flight Haxe.
package flighthq._internal;

// Constructed through `_Runtime` and used as the typed receiver surface for
// generated Map operations.
@:keep
class _Map {
  private final items:Array<{key:Dynamic, value:Dynamic}> = [];

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
  public function delete_(key:Dynamic):Bool {
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

  public function get(key:Dynamic):Dynamic {
    final index = indexOf(key);
    return index < 0 ? null : items[index].value;
  }

  public function has(key:Dynamic):Bool return indexOf(key) >= 0;

  private function indexOf(key:Dynamic):Int {
    for (index in 0...items.length) if (items[index].key == key) return index;
    return -1;
  }

  public function iterator():Iterator<Array<Dynamic>> return entries().iterator();

  public function keys():Array<Dynamic> return [for (item in items) item.key];

  public function set(key:Dynamic, value:Dynamic):_Map {
    final index = indexOf(key);
    if (index < 0) items.push({key: key, value: value}); else items[index].value = value;
    size = items.length;
    return this;
  }

  public function values():Array<Dynamic> return [for (item in items) item.value];
}
