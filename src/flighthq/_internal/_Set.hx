// Maintained runtime support for generated Flight Haxe.
package flighthq._internal;

class _Set {
  private final items:Array<Dynamic> = [];
  public var size(get, never):Int;

  public function new(source:Dynamic) {
    if (source != null) for (item in (cast source : Array<Dynamic>)) add(item);
  }

  public function add(value:Dynamic):_Set {
    if (!has(value)) items.push(value);
    return this;
  }

  public function clear():Void items.resize(0);

  public function delete_(value:Dynamic):Bool return items.remove(value);

  public function entries():Array<Array<Dynamic>> return [for (item in items) [item, item]];

  public function forEach(callback:(Dynamic, Dynamic, _Set)->Void):Void {
    for (item in items) callback(item, item, this);
  }

  private inline function get_size():Int return items.length;

  public inline function has(value:Dynamic):Bool return items.indexOf(value) >= 0;

  public function iterator():Iterator<Dynamic> return items.iterator();

  public function keys():Array<Dynamic> return items.copy();

  public function values():Array<Dynamic> return items.copy();
}
