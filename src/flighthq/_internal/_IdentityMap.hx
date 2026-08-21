// Maintained runtime support for generated Flight Haxe.
package flighthq._internal;

/** Strong portable object-identity map.
 *
 * `haxe.ds.ObjectMap` uses native dictionary keys on Python, where mutable
 * arrays and anonymous objects may be unhashable. Toolkit identity operations
 * must accept the same object families as JavaScript WeakMap and structured
 * clone, so this deliberately small map uses an identity scan instead.
 */
class _IdentityMap<V> {
  final keys:Array<Dynamic> = [];
  final values:Array<V> = [];

  public function new() {}

  public function exists(key:Dynamic):Bool return indexOf(key) >= 0;

  public function get(key:Dynamic):Null<V> {
    final index = indexOf(key);
    return index < 0 ? null : values[index];
  }

  public function remove(key:Dynamic):Bool {
    final index = indexOf(key);
    if (index < 0) return false;
    keys.splice(index, 1);
    values.splice(index, 1);
    return true;
  }

  public function set(key:Dynamic, value:V):Void {
    final index = indexOf(key);
    if (index < 0) {
      keys.push(key);
      values.push(value);
    } else {
      values[index] = value;
    }
  }

  function indexOf(key:Dynamic):Int {
    for (index in 0...keys.length) if (sameIdentity(keys[index], key)) return index;
    return -1;
  }

  static function sameIdentity(left:Dynamic, right:Dynamic):Bool {
    #if python
    return python.Syntax.code('{0} is {1}', left, right);
    #elseif js
    return js.Syntax.code('{0} === {1}', left, right);
    #else
    return left == right;
    #end
  }
}
