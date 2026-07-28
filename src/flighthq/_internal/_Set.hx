// Maintained runtime support for generated Flight Haxe.
package flighthq._internal;

// Constructed through `_Runtime` and used as the typed receiver surface for
// generated Set operations.
@:keep
class _Set {
  private final items:Array<Dynamic> = [];

  public var size(default, null):Int = 0;

  public function new(?source:Dynamic) {
    if (source != null) for (item in (cast source : Array<Dynamic>)) add(item);
  }

  public function add(value:Dynamic):_Set {
    if (!has(value)) items.push(value);
    size = items.length;
    return this;
  }

  public function clear():Void {
    items.resize(0);
    size = 0;
  }

  #if js
  @:native("delete")
  #end
  public function delete_(value:Dynamic):Bool {
    final removed = items.remove(value);
    size = items.length;
    return removed;
  }

  public function entries():Array<Array<Dynamic>> return [for (item in items) [item, item]];

  public function forEach(callback:Dynamic):Void {
    for (item in items) _Runtime.callValue(callback, [item, item, this]);
  }

  public function has(value:Dynamic):Bool return items.indexOf(value) >= 0;

  public function iterator():Iterator<Dynamic> return items.iterator();

  public function keys():Array<Dynamic> return items.copy();

  public function values():Array<Dynamic> return items.copy();
}
