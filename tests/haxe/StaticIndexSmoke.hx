package;

import flight._internal._Float32Array;
import flight._internal._Float64Array;
import flight._internal._Int16Array;
import flight._internal._Int32Array;
import flight._internal._Int8Array;
import flight._internal._Runtime;
import flight._internal._StaticIndex;
import flight._internal._UInt16Array;
import flight._internal._UInt32Array;
import flight._internal._UInt8Array;
import flight._internal._UInt8ClampedArray;

class StaticIndexSmoke {
  static var ordered:Array<Dynamic>;
  static var order = '';

  public static function run():Void {
    assertArrayFractionalIndex();
    assertFloat32FractionalIndex();
    assertArrayOutOfBounds([10, 20], new _Float32Array([10, 20]));
    assertDynamicOutOfBounds([10, 20], new _Float32Array([10, 20]));
    assertTypedArrayOutOfBounds(new _Float32Array([10, 20]));
    assertMixedReceivers();
    assertWriteResults();
    assertEvaluationOrder();
    assertMonomorphicFastPaths();
  }

  static function assertArrayFractionalIndex():Void {
    final values:Array<Dynamic> = [10, 20];
    #if js
    if (_StaticIndex.readArray(values, 1.5) != null) throw 'JS fractional array read was truncated';
    if (_StaticIndex.writeArray(values, 1.5, 7) != 7) throw 'array setter lost its right-hand value';
    if (values[1] != 20 || _StaticIndex.readArray(values, 1.5) != 7) {
      throw 'JS fractional array write was truncated';
    }
    #else
    if (_StaticIndex.readArray(values, 1.5) != 20) throw 'portable fractional array read was not truncated';
    if (_StaticIndex.writeArray(values, 1.5, 7) != 7 || values[1] != 7) {
      throw 'portable fractional array write was not truncated';
    }
    #end
  }

  static function assertFloat32FractionalIndex():Void {
    final fractional = new _Float32Array([10, 20]);
    #if js
    if (_StaticIndex.readFloat32Array(fractional, 1.5) != null) {
      throw 'JS fractional typed-array read was truncated';
    }
    if (_StaticIndex.writeFloat32Array(fractional, 1.5, 7) != 7) {
      throw 'typed-array fractional setter lost its right-hand value';
    }
    if (_StaticIndex.readFloat32Array(fractional, 1) != 20) {
      throw 'JS fractional typed-array write changed an integer element';
    }
    #else
    if (_StaticIndex.readFloat32Array(fractional, 1.5) != 20) {
      throw 'portable fractional typed-array read was not truncated';
    }
    if (_StaticIndex.writeFloat32Array(fractional, 1.5, 7) != 7
      || _StaticIndex.readFloat32Array(fractional, 1) != 7) {
      throw 'portable fractional typed-array write was not truncated';
    }
    #end
  }

  static function assertMixedReceivers():Void {
    final mixedArray:Array<Dynamic> = [3, 4];
    final mixedFloat32 = new _Float32Array([5, 6]);
    if (_StaticIndex.readArrayOrFloat32Array(mixedArray, 1) != 4
      || _StaticIndex.readArrayOrFloat32Array(mixedFloat32, 1) != 6) {
      throw 'Array-or-Float32Array read';
    }
    if (_StaticIndex.writeArrayOrFloat32Array(mixedArray, 0, 7) != 7
      || _StaticIndex.writeArrayOrFloat32Array(mixedFloat32, 0, 8) != 8
      || mixedArray[0] != 7
      || _StaticIndex.readFloat32Array(mixedFloat32, 0) != 8) {
      throw 'Array-or-Float32Array write';
    }

    final mixedUint16 = new _UInt16Array([65535]);
    final mixedUint32 = new _UInt32Array([4294967295.0]);
    if (_StaticIndex.readUint16ArrayOrUint32Array(mixedUint16, 0) != 65535
      || _StaticIndex.readUint16ArrayOrUint32Array(mixedUint32, 0) != 4294967295.0) {
      throw 'Uint16Array-or-Uint32Array read';
    }
  }

  static function assertWriteResults():Void {
    assertWrite(
      _StaticIndex.writeFloat32Array(new _Float32Array(1), 0, 1.25),
      1.25,
      'Float32Array setter result',
    );
    assertStoredFloat32(1.25);
    assertWrite(
      _StaticIndex.writeFloat64Array(new _Float64Array(1), 0, 2.5),
      2.5,
      'Float64Array setter result',
    );
    assertWrite(_StaticIndex.writeInt16Array(new _Int16Array(1), 0, 65535), 65535, 'Int16Array setter result');
    assertStoredInt16(-1);
    assertWrite(
      _StaticIndex.writeInt32Array(new _Int32Array(1), 0, 4294967295.0),
      4294967295.0,
      'Int32Array setter result',
    );
    assertStoredInt32(-1);
    assertWrite(_StaticIndex.writeInt8Array(new _Int8Array(1), 0, 255), 255, 'Int8Array setter result');
    assertStoredInt8(-1);
    assertWrite(_StaticIndex.writeUint16Array(new _UInt16Array(1), 0, -1), -1, 'Uint16Array setter result');
    assertStoredUint16(65535);
    assertWrite(_StaticIndex.writeUint32Array(new _UInt32Array(1), 0, -1), -1, 'Uint32Array setter result');
    assertStoredUint32(4294967295.0);
    assertWrite(_StaticIndex.writeUint8Array(new _UInt8Array(1), 0, 300), 300, 'Uint8Array setter result');
    assertStoredUint8(44);
    assertWrite(
      _StaticIndex.writeUint8ClampedArray(new _UInt8ClampedArray(1), 0, 300),
      300,
      'Uint8ClampedArray setter result',
    );
    assertStoredClamped(255);
  }

  static function assertEvaluationOrder():Void {
    ordered = [0];
    order = '';
    if (_StaticIndex.writeArray(orderedSource(), orderedKey(), orderedValue()) != 9 || order != 'rkv') {
      throw 'indexed endpoint argument evaluation order changed';
    }
  }

  static function assertMonomorphicFastPaths():Void {
    final values:Array<Float> = [1.0, 2.0, 3.0, 4.0];
    final typed = new _Float32Array(values);
    var sum = 0.0;
    for (iteration in 0...100000) {
      final index:Float = iteration & 3;
      sum += _StaticIndex.readFloatArrayTyped(values, index);
      sum += _StaticIndex.readFloat32ArrayTyped(typed, index);
    }
    if (sum != 500000.0) throw 'monomorphic indexed reads changed values';
    if (_StaticIndex.writeFloatArrayTyped(values, 0, 5.0) != 5.0 || values[0] != 5.0) {
      throw 'monomorphic Array<Float> write failed';
    }
    if (_StaticIndex.writeFloat32ArrayTyped(typed, 0, 6.0) != 6.0
      || _StaticIndex.readFloat32ArrayTyped(typed, 0) != 6.0) {
      throw 'monomorphic Float32Array write failed';
    }
  }

  static function assertWrite(actual:Dynamic, expected:Dynamic, label:String):Void {
    if (actual != expected) throw label;
  }

  static function assertNullish(actual:Dynamic, label:String):Void {
    if (actual != null) throw label + ' was not nullish';
  }

  static function assertArrayOutOfBounds(values:Array<Dynamic>, fractional:_Float32Array):Void {
    assertNullish(_StaticIndex.readArray(values, 99), 'Array read');
    assertNullish(_StaticIndex.readArray(values, -1), 'negative Array read');
    assertNullish(_StaticIndex.readArrayOrFloat32Array(values, 99), 'Array union read');
    assertNullish(_StaticIndex.readArrayOrFloat32Array(fractional, 99), 'Float32Array union read');
  }

  static function assertDynamicOutOfBounds(values:Array<Dynamic>, fractional:_Float32Array):Void {
    assertNullish(_Runtime.getIndex(values, 99), 'dynamic Array read');
    assertNullish(_Runtime.getIndex(fractional, 99), 'dynamic typed-array read');
    assertNullish(_Runtime.getIndex('x', 99), 'dynamic String read');
  }

  static function assertTypedArrayOutOfBounds(fractional:_Float32Array):Void {
    assertNullish(_StaticIndex.readFloat32Array(fractional, 99), 'Float32Array read');
    assertNullish(_StaticIndex.readFloat64Array(new _Float64Array([1]), 99), 'Float64Array read');
    assertNullish(_StaticIndex.readInt16Array(new _Int16Array([1]), 99), 'Int16Array read');
    assertNullish(_StaticIndex.readInt32Array(new _Int32Array([1]), 99), 'Int32Array read');
    assertNullish(_StaticIndex.readInt8Array(new _Int8Array([1]), 99), 'Int8Array read');
    assertNullish(_StaticIndex.readUint16Array(new _UInt16Array([1]), 99), 'Uint16Array read');
    assertNullish(
      _StaticIndex.readUint16ArrayOrUint32Array(new _UInt16Array([1]), 99),
      'Uint16Array union read',
    );
    assertNullish(
      _StaticIndex.readUint16ArrayOrUint32Array(new _UInt32Array([1]), 99),
      'Uint32Array union read',
    );
    assertNullish(_StaticIndex.readUint32Array(new _UInt32Array([1]), 99), 'Uint32Array read');
    assertNullish(_StaticIndex.readUint8Array(new _UInt8Array([1]), 99), 'Uint8Array read');
    assertNullish(
      _StaticIndex.readUint8ClampedArray(new _UInt8ClampedArray([1]), 99),
      'Uint8ClampedArray read',
    );
  }

  static function assertStoredFloat32(expected:Float):Void {
    final value = new _Float32Array(1);
    _StaticIndex.writeFloat32Array(value, 0, expected);
    if (_StaticIndex.readFloat32Array(value, 0) != expected) throw 'Float32Array write coercion';
  }

  static function assertStoredInt16(expected:Int):Void {
    final value = new _Int16Array(1);
    _StaticIndex.writeInt16Array(value, 0, 65535);
    if (_StaticIndex.readInt16Array(value, 0) != expected) throw 'Int16Array write coercion';
  }

  static function assertStoredInt32(expected:Int):Void {
    final value = new _Int32Array(1);
    _StaticIndex.writeInt32Array(value, 0, 4294967295.0);
    if (_StaticIndex.readInt32Array(value, 0) != expected) throw 'Int32Array write coercion';
  }

  static function assertStoredInt8(expected:Int):Void {
    final value = new _Int8Array(1);
    _StaticIndex.writeInt8Array(value, 0, 255);
    if (_StaticIndex.readInt8Array(value, 0) != expected) throw 'Int8Array write coercion';
  }

  static function assertStoredUint16(expected:Int):Void {
    final value = new _UInt16Array(1);
    _StaticIndex.writeUint16Array(value, 0, -1);
    if (_StaticIndex.readUint16Array(value, 0) != expected) throw 'Uint16Array write coercion';
  }

  static function assertStoredUint32(expected:Float):Void {
    final value = new _UInt32Array(1);
    _StaticIndex.writeUint32Array(value, 0, -1);
    if (_StaticIndex.readUint32Array(value, 0) != expected) throw 'Uint32Array write coercion';
  }

  static function assertStoredUint8(expected:Int):Void {
    final value = new _UInt8Array(1);
    _StaticIndex.writeUint8Array(value, 0, 300);
    if (_StaticIndex.readUint8Array(value, 0) != expected) throw 'Uint8Array write coercion';
  }

  static function assertStoredClamped(expected:Int):Void {
    final value = new _UInt8ClampedArray(1);
    _StaticIndex.writeUint8ClampedArray(value, 0, 300);
    if (_StaticIndex.readUint8ClampedArray(value, 0) != expected) throw 'Uint8ClampedArray write coercion';
  }

  static function orderedSource():Array<Dynamic> {
    order += 'r';
    return ordered;
  }

  static function orderedKey():Float {
    order += 'k';
    return 0;
  }

  static function orderedValue():Dynamic {
    order += 'v';
    return 9;
  }

  static function main():Void {
    run();
  }
}
