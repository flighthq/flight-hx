package flight._internal;

#if js
@:forward
abstract _Map<K, V>(js.lib.Map<K, V>) from js.lib.Map<K, V> to js.lib.Map<K, V> {
  public inline function new(?entries:Dynamic) {
    this = cast js.Syntax.code("{0} == null ? new Map() : new Map({0})", entries);
  }

  public inline function entries():_MapIterator<Dynamic> {
    return new _MapIterator(cast (cast this : js.lib.Map<K, V>).entries());
  }

  public inline function keys():_MapIterator<K> {
    return new _MapIterator((cast this : js.lib.Map<K, V>).keys());
  }

  /** TypeScript Map iteration yields key/value entries, unlike Haxe's native JS Map adapter. */
  public inline function iterator():_MapIterator<Dynamic> {
    return entries();
  }

  public inline function values():_MapIterator<V> {
    return new _MapIterator((cast this : js.lib.Map<K, V>).values());
  }
}

class _MapIterator<T> {
  final source:js.lib.Iterator<T>;
  var step:Null<js.lib.Iterator.IteratorStep<T>>;

  public inline function new(source:js.lib.Iterator<T>) {
    this.source = source;
  }

  public function copy():Array<T> {
    final values:Array<T> = [];
    while (hasNext()) values.push(next());
    return values;
  }

  public inline function iterator():_MapIterator<T> {
    return this;
  }

  public function hasNext():Bool {
    if (step == null) step = source.next();
    return !step.done;
  }

  public function next():T {
    if (step == null) step = source.next();
    final value:T = cast step.value;
    step = null;
    return value;
  }
}
#else
/** Cross-target Map carrier for host-free transpiled modules. */
class _Map<K, V> {
  final items:Array<_MapEntry<K, V>> = [];

  public var size(get, never):Int;

  public function new(?entries:Array<Array<Dynamic>>) {
    if (entries != null) {
      for (entry in entries) set(cast entry[0], cast entry[1]);
    }
  }

  public function clear():Void {
    items.resize(0);
  }

  public function delete(key:K):Bool {
    final index = indexOf(key);
    if (index == -1) return false;
    items.splice(index, 1);
    return true;
  }

  public function entries():Iterator<Array<Dynamic>> {
    return [for (item in items) ([cast item.key, cast item.value] : Array<Dynamic>)].iterator();
  }

  public function forEach(callback:(V, K, _Map<K, V>)->Void):Void {
    for (item in items.copy()) callback(item.value, item.key, this);
  }

  public function get(key:K):Null<V> {
    final index = indexOf(key);
    return index == -1 ? null : items[index].value;
  }

  public function has(key:K):Bool {
    return indexOf(key) != -1;
  }

  public function keys():Iterator<K> {
    return [for (item in items) item.key].iterator();
  }

  public function iterator():Iterator<Array<Dynamic>> {
    return entries();
  }

  public function set(key:K, value:V):_Map<K, V> {
    final index = indexOf(key);
    if (index == -1) items.push({key: key, value: value});
    else items[index].value = value;
    return this;
  }

  public function values():Iterator<V> {
    return [for (item in items) item.value].iterator();
  }

  inline function get_size():Int {
    return items.length;
  }

  function indexOf(key:K):Int {
    for (index in 0...items.length) {
      final candidate = items[index].key;
      if (candidate == key || (isNaN(candidate) && isNaN(key))) return index;
    }
    return -1;
  }

  static function isNaN(value:Dynamic):Bool {
    return Std.isOfType(value, Float) && Math.isNaN(cast value);
  }
}

private typedef _MapEntry<K, V> = {
  final key:K;
  var value:V;
}
#end
