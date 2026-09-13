package flight._internal;

#if js
typedef _Set<T> = js.lib.Set<T>;
#else
/** Cross-target Set carrier for host-free transpiled modules. */
class _Set<T> {
  final valuesByKey:_Map<T, Bool>;

  public var size(get, never):Int;

  public function new(?values:Array<T>) {
    valuesByKey = new _Map();
    if (values != null) for (value in values) add(value);
  }

  public function add(value:T):_Set<T> {
    valuesByKey.set(value, true);
    return this;
  }

  public function clear():Void {
    valuesByKey.clear();
  }

  public function delete(value:T):Bool {
    return valuesByKey.delete(value);
  }

  public function entries():Iterator<Array<T>> {
    return [for (value in valuesByKey.keys()) [value, value]].iterator();
  }

  public function forEach(callback:(T, T, _Set<T>)->Void):Void {
    for (value in valuesByKey.keys()) callback(value, value, this);
  }

  public function has(value:T):Bool {
    return valuesByKey.has(value);
  }

  public function keys():Iterator<T> {
    return valuesByKey.keys();
  }

  public function values():Iterator<T> {
    return valuesByKey.keys();
  }

  inline function get_size():Int {
    return valuesByKey.size;
  }
}
#end
