package flight._internal;

#if js
typedef _Map<K, V> = js.lib.Map<K, V>;
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
