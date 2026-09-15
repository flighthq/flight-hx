import flight._internal._Array;
import flight._internal._ArrayBuffer;
import flight._internal._DataView;
import flight._internal._Map;
import flight._internal._Number;
import flight._internal._Object;
import flight._internal._Promise;
import flight._internal._Set;
import flight._internal._StringTools;
import flight._internal._Symbol;
import flight._internal._UInt8Array;
import flight._internal._UInt32Array;

/** Loads every maintained runtime module and exercises compiler-elected helpers on JavaScript. */
class RuntimeContractCompile {
  static function main():Void {
    final parts = _StringTools.split('alpha,beta', ',');
    if (parts.length != 2 || parts[1] != 'beta') throw 'String.split runtime mismatch';
    if (_Number.toString(255, 16) != 'ff') throw 'Number.toString runtime mismatch';
    final values:Array<Int> = _Array.from([1, 2]);
    if (values.length != 2 || values[1] != 2) throw 'Array.from runtime mismatch';
    final object = _Object.create(null);
    Reflect.setField(object, 'answer', 42);
    if (!_Object.hasOwn(object, 'answer') || _Object.values(object)[0] != 42) throw 'Object runtime mismatch';
    _Object.freeze(object);
    if (!_Object.isFrozen(object)) throw 'Object.freeze runtime mismatch';
    final buffer = new _ArrayBuffer(8);
    final view = new _DataView(buffer);
    if (!_ArrayBuffer.isView(view) || _ArrayBuffer.isView(buffer)) throw 'ArrayBuffer.isView runtime mismatch';
    view.setUint16(1.0, 65535.0, true);
    if (view.getUint16(1.0, true) != 65535.0) throw 'DataView runtime mismatch';
    final bytes = new _UInt8Array([1.0, 2.0, 3.0]);
    final copied = bytes.copy();
    var iterated = 0.0;
    for (byte in bytes) iterated += byte;
    if (copied.length != 3 || copied[2] != 3.0 || iterated != 6.0) throw 'Uint8Array runtime mismatch';
    final words = new _UInt32Array(2.0);
    words.set([4294967295.0, 2.0]);
    if (words[0] != 4294967295.0 || words[1] != 2.0) throw 'Uint32Array runtime mismatch';
    final set = new _Set<Int>([1, 1, 2]);
    final setValues = set.copy();
    if (setValues.length != 2 || setValues[1] != 2) throw 'Set runtime mismatch';
    final map = new _Map<String, Int>([['one', 1], ['two', 2]]);
    final mapKeys = map.keys().copy();
    var mapTotal = 0;
    for (value in map.values()) mapTotal += value;
    var entryTotal = 0;
    for (entry in map) entryTotal += entry[1];
    if (mapKeys.length != 2 || mapKeys[1] != 'two' || mapTotal != 3 || entryTotal != 3) throw 'Map iterator runtime mismatch';
    final setAsArray:Array<Dynamic> = set;
    if (setAsArray.length != 2 || setAsArray[1] != 2) throw 'Set array conversion mismatch';
    final defined:Dynamic = {};
    _Object.defineProperty(defined, 'answer', {value: 42, configurable: true});
    if (Reflect.field(defined, 'answer') != 42) throw 'Object.defineProperty runtime mismatch';
    if (_Symbol.iterator != js.lib.Symbol.iterator) throw 'Symbol.iterator runtime mismatch';
    _Promise.allSettled([
      _Promise.resolve(7),
      _Promise.reject('expected'),
    ]).then((settlements) -> {
      if (settlements.length != 2
        || Reflect.field(settlements[0], 'status') != 'fulfilled'
        || Reflect.field(settlements[0], 'value') != 7
        || Reflect.field(settlements[1], 'status') != 'rejected'
        || Reflect.field(settlements[1], 'reason') != 'expected') {
        throw 'Promise.allSettled runtime mismatch';
      }
      trace('RUNTIME_CONTRACT_OK');
    });
  }
}
