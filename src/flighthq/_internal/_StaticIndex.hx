// Maintained typed endpoints for checker-proven generated indexed access.
package flighthq._internal;

class _StaticIndex {
  #if !js
  static inline function boundedIndex(key:Dynamic, length:Int):Int {
    final index = Std.int(key);
    return index < 0 || index >= length ? -1 : index;
  }
  #end

  public static inline function readFloatArrayTyped(source:Array<Float>, key:Float):Float {
    #if js
    return js.Syntax.code('{0}[{1}]', source, key);
    #else
    return source[Std.int(key)];
    #end
  }

  public static inline function writeFloatArrayTyped(source:Array<Float>, key:Float, value:Float):Float {
    #if js
    js.Syntax.code('{0}[{1}] = {2}', source, key, value);
    #else
    source[Std.int(key)] = value;
    #end
    return value;
  }

  public static inline function readFloat32ArrayTyped(source:_Float32Array, key:Float):Float {
    #if js
    return js.Syntax.code('{0}[{1}]', source, key);
    #else
    return source[Std.int(key)];
    #end
  }

  public static inline function writeFloat32ArrayTyped(source:_Float32Array, key:Float, value:Float):Float {
    #if js
    js.Syntax.code('{0}[{1}] = {2}', source, key, value);
    #else
    source[Std.int(key)] = value;
    #end
    return value;
  }

  public static inline function readFloat64ArrayTyped(source:_Float64Array, key:Float):Float {
    #if js
    return js.Syntax.code('{0}[{1}]', source, key);
    #else
    return source[Std.int(key)];
    #end
  }

  public static inline function writeFloat64ArrayTyped(source:_Float64Array, key:Float, value:Float):Float {
    #if js
    js.Syntax.code('{0}[{1}] = {2}', source, key, value);
    #else
    source[Std.int(key)] = value;
    #end
    return value;
  }

  public static inline function readInt16ArrayTyped(source:_Int16Array, key:Float):Float {
    #if js
    return js.Syntax.code('{0}[{1}]', source, key);
    #else
    return source[Std.int(key)];
    #end
  }

  public static inline function writeInt16ArrayTyped(source:_Int16Array, key:Float, value:Float):Float {
    #if js
    js.Syntax.code('{0}[{1}] = {2}', source, key, value);
    #else
    source[Std.int(key)] = value;
    #end
    return value;
  }

  public static inline function readInt32ArrayTyped(source:_Int32Array, key:Float):Float {
    #if js
    return js.Syntax.code('{0}[{1}]', source, key);
    #else
    return source[Std.int(key)];
    #end
  }

  public static inline function writeInt32ArrayTyped(source:_Int32Array, key:Float, value:Float):Float {
    #if js
    js.Syntax.code('{0}[{1}] = {2}', source, key, value);
    #else
    source[Std.int(key)] = value;
    #end
    return value;
  }

  public static inline function readInt8ArrayTyped(source:_Int8Array, key:Float):Float {
    #if js
    return js.Syntax.code('{0}[{1}]', source, key);
    #else
    return source[Std.int(key)];
    #end
  }

  public static inline function writeInt8ArrayTyped(source:_Int8Array, key:Float, value:Float):Float {
    #if js
    js.Syntax.code('{0}[{1}] = {2}', source, key, value);
    #else
    source[Std.int(key)] = value;
    #end
    return value;
  }

  public static inline function readUint16ArrayTyped(source:_UInt16Array, key:Float):Float {
    #if js
    return js.Syntax.code('{0}[{1}]', source, key);
    #else
    return source[Std.int(key)];
    #end
  }

  public static inline function writeUint16ArrayTyped(source:_UInt16Array, key:Float, value:Float):Float {
    #if js
    js.Syntax.code('{0}[{1}] = {2}', source, key, value);
    #else
    source[Std.int(key)] = value;
    #end
    return value;
  }

  public static inline function readUint32ArrayTyped(source:_UInt32Array, key:Float):Float {
    #if js
    return js.Syntax.code('{0}[{1}]', source, key);
    #else
    return source[Std.int(key)];
    #end
  }

  public static inline function writeUint32ArrayTyped(source:_UInt32Array, key:Float, value:Float):Float {
    #if js
    js.Syntax.code('{0}[{1}] = {2}', source, key, value);
    #else
    source[Std.int(key)] = value;
    #end
    return value;
  }

  public static inline function readUint8ArrayTyped(source:_UInt8Array, key:Float):Float {
    #if js
    return js.Syntax.code('{0}[{1}]', source, key);
    #else
    return source[Std.int(key)];
    #end
  }

  public static inline function writeUint8ArrayTyped(source:_UInt8Array, key:Float, value:Float):Float {
    #if js
    js.Syntax.code('{0}[{1}] = {2}', source, key, value);
    #else
    source[Std.int(key)] = value;
    #end
    return value;
  }

  public static inline function readUint8ClampedArrayTyped(source:_UInt8ClampedArray, key:Float):Float {
    #if js
    return js.Syntax.code('{0}[{1}]', source, key);
    #else
    return source[Std.int(key)];
    #end
  }

  public static inline function writeUint8ClampedArrayTyped(
    source:_UInt8ClampedArray,
    key:Float,
    value:Float
  ):Float {
    #if js
    js.Syntax.code('{0}[{1}] = {2}', source, key, value);
    #else
    source[Std.int(key)] = value;
    #end
    return value;
  }

  #if neko
  public static function readArray(source:Dynamic, key:Dynamic):Dynamic {
  #else
  public static inline function readArray(source:Dynamic, key:Dynamic):Dynamic {
  #end
    #if js
    return js.Syntax.code('{0}[{1}]', source, key);
    #else
    final values:Array<Dynamic> = cast source;
    final index = boundedIndex(key, values.length);
    return index < 0 ? _Runtime.UNDEFINED : values[index];
    #end
  }

  public static inline function writeArray(source:Dynamic, key:Dynamic, value:Dynamic):Dynamic {
    #if js
    js.Syntax.code('{0}[{1}] = {2}', source, key, value);
    #else
    (cast source : Array<Dynamic>)[Std.int(key)] = value;
    #end
    return value;
  }

  #if neko
  public static function readArrayOrFloat32Array(source:Dynamic, key:Dynamic):Dynamic {
  #else
  public static inline function readArrayOrFloat32Array(source:Dynamic, key:Dynamic):Dynamic {
  #end
    #if js
    return js.Syntax.code('{0}[{1}]', source, key);
    #elseif lime
    if (Std.isOfType(source, Array)) {
      final values:Array<Dynamic> = cast source;
      final index = boundedIndex(key, values.length);
      return index < 0 ? _Runtime.UNDEFINED : values[index];
    }
    final values:_LimeTypedArray = cast source;
    final index = boundedIndex(key, values.length);
    return index < 0 ? _Runtime.UNDEFINED : values.get(index);
    #else
    final values:Array<Dynamic> = cast source;
    final index = boundedIndex(key, values.length);
    return index < 0 ? _Runtime.UNDEFINED : values[index];
    #end
  }

  public static inline function writeArrayOrFloat32Array(source:Dynamic, key:Dynamic, value:Dynamic):Dynamic {
    #if js
    js.Syntax.code('{0}[{1}] = {2}', source, key, value);
    #elseif lime
    if (Std.isOfType(source, Array)) {
      (cast source : Array<Dynamic>)[Std.int(key)] = value;
    } else {
      (cast source : _LimeTypedArray).setValue(Std.int(key), value);
    }
    #else
    (cast source : Array<Dynamic>)[Std.int(key)] = value;
    #end
    return value;
  }

  #if neko
  public static function readFloat32Array(source:Dynamic, key:Dynamic):Dynamic {
  #else
  public static inline function readFloat32Array(source:Dynamic, key:Dynamic):Dynamic {
  #end
    #if js
    return js.Syntax.code('{0}[{1}]', source, key);
    #else
    final values:_Float32Array = cast source;
    final index = boundedIndex(key, values.length);
    return index < 0 ? _Runtime.UNDEFINED : values[index];
    #end
  }

  public static inline function writeFloat32Array(source:Dynamic, key:Dynamic, value:Dynamic):Dynamic {
    #if js
    js.Syntax.code('{0}[{1}] = {2}', source, key, value);
    #else
    (cast source : _Float32Array)[Std.int(key)] = value;
    #end
    return value;
  }

  #if neko
  public static function readFloat64Array(source:Dynamic, key:Dynamic):Dynamic {
  #else
  public static inline function readFloat64Array(source:Dynamic, key:Dynamic):Dynamic {
  #end
    #if js
    return js.Syntax.code('{0}[{1}]', source, key);
    #else
    final values:_Float64Array = cast source;
    final index = boundedIndex(key, values.length);
    return index < 0 ? _Runtime.UNDEFINED : values[index];
    #end
  }

  public static inline function writeFloat64Array(source:Dynamic, key:Dynamic, value:Dynamic):Dynamic {
    #if js
    js.Syntax.code('{0}[{1}] = {2}', source, key, value);
    #else
    (cast source : _Float64Array)[Std.int(key)] = value;
    #end
    return value;
  }

  #if neko
  public static function readInt16Array(source:Dynamic, key:Dynamic):Dynamic {
  #else
  public static inline function readInt16Array(source:Dynamic, key:Dynamic):Dynamic {
  #end
    #if js
    return js.Syntax.code('{0}[{1}]', source, key);
    #else
    final values:_Int16Array = cast source;
    final index = boundedIndex(key, values.length);
    return index < 0 ? _Runtime.UNDEFINED : values[index];
    #end
  }

  public static inline function writeInt16Array(source:Dynamic, key:Dynamic, value:Dynamic):Dynamic {
    #if js
    js.Syntax.code('{0}[{1}] = {2}', source, key, value);
    #else
    (cast source : _Int16Array)[Std.int(key)] = value;
    #end
    return value;
  }

  #if neko
  public static function readInt32Array(source:Dynamic, key:Dynamic):Dynamic {
  #else
  public static inline function readInt32Array(source:Dynamic, key:Dynamic):Dynamic {
  #end
    #if js
    return js.Syntax.code('{0}[{1}]', source, key);
    #else
    final values:_Int32Array = cast source;
    final index = boundedIndex(key, values.length);
    return index < 0 ? _Runtime.UNDEFINED : values[index];
    #end
  }

  public static inline function writeInt32Array(source:Dynamic, key:Dynamic, value:Dynamic):Dynamic {
    #if js
    js.Syntax.code('{0}[{1}] = {2}', source, key, value);
    #else
    (cast source : _Int32Array)[Std.int(key)] = value;
    #end
    return value;
  }

  #if neko
  public static function readInt8Array(source:Dynamic, key:Dynamic):Dynamic {
  #else
  public static inline function readInt8Array(source:Dynamic, key:Dynamic):Dynamic {
  #end
    #if js
    return js.Syntax.code('{0}[{1}]', source, key);
    #else
    final values:_Int8Array = cast source;
    final index = boundedIndex(key, values.length);
    return index < 0 ? _Runtime.UNDEFINED : values[index];
    #end
  }

  public static inline function writeInt8Array(source:Dynamic, key:Dynamic, value:Dynamic):Dynamic {
    #if js
    js.Syntax.code('{0}[{1}] = {2}', source, key, value);
    #else
    (cast source : _Int8Array)[Std.int(key)] = value;
    #end
    return value;
  }

  #if neko
  public static function readUint16Array(source:Dynamic, key:Dynamic):Dynamic {
  #else
  public static inline function readUint16Array(source:Dynamic, key:Dynamic):Dynamic {
  #end
    #if js
    return js.Syntax.code('{0}[{1}]', source, key);
    #else
    final values:_UInt16Array = cast source;
    final index = boundedIndex(key, values.length);
    return index < 0 ? _Runtime.UNDEFINED : values[index];
    #end
  }

  public static inline function writeUint16Array(source:Dynamic, key:Dynamic, value:Dynamic):Dynamic {
    #if js
    js.Syntax.code('{0}[{1}] = {2}', source, key, value);
    #else
    (cast source : _UInt16Array)[Std.int(key)] = value;
    #end
    return value;
  }

  #if neko
  public static function readUint16ArrayOrUint32Array(source:Dynamic, key:Dynamic):Dynamic {
  #else
  public static inline function readUint16ArrayOrUint32Array(source:Dynamic, key:Dynamic):Dynamic {
  #end
    #if js
    return js.Syntax.code('{0}[{1}]', source, key);
    #elseif lime
    final values:_LimeTypedArray = cast source;
    final index = boundedIndex(key, values.length);
    return index < 0 ? _Runtime.UNDEFINED : values.get(index);
    #else
    final values:Array<Dynamic> = cast source;
    final index = boundedIndex(key, values.length);
    return index < 0 ? _Runtime.UNDEFINED : values[index];
    #end
  }

  #if neko
  public static function readUint32Array(source:Dynamic, key:Dynamic):Dynamic {
  #else
  public static inline function readUint32Array(source:Dynamic, key:Dynamic):Dynamic {
  #end
    #if js
    return js.Syntax.code('{0}[{1}]', source, key);
    #else
    final values:_UInt32Array = cast source;
    final index = boundedIndex(key, values.length);
    return index < 0 ? _Runtime.UNDEFINED : values[index];
    #end
  }

  public static inline function writeUint32Array(source:Dynamic, key:Dynamic, value:Dynamic):Dynamic {
    #if js
    js.Syntax.code('{0}[{1}] = {2}', source, key, value);
    #else
    (cast source : _UInt32Array)[Std.int(key)] = value;
    #end
    return value;
  }

  #if neko
  public static function readUint8Array(source:Dynamic, key:Dynamic):Dynamic {
  #else
  public static inline function readUint8Array(source:Dynamic, key:Dynamic):Dynamic {
  #end
    #if js
    return js.Syntax.code('{0}[{1}]', source, key);
    #else
    final values:_UInt8Array = cast source;
    final index = boundedIndex(key, values.length);
    return index < 0 ? _Runtime.UNDEFINED : values[index];
    #end
  }

  public static inline function writeUint8Array(source:Dynamic, key:Dynamic, value:Dynamic):Dynamic {
    #if js
    js.Syntax.code('{0}[{1}] = {2}', source, key, value);
    #else
    (cast source : _UInt8Array)[Std.int(key)] = value;
    #end
    return value;
  }

  #if neko
  public static function readUint8ClampedArray(source:Dynamic, key:Dynamic):Dynamic {
  #else
  public static inline function readUint8ClampedArray(source:Dynamic, key:Dynamic):Dynamic {
  #end
    #if js
    return js.Syntax.code('{0}[{1}]', source, key);
    #else
    final values:_UInt8ClampedArray = cast source;
    final index = boundedIndex(key, values.length);
    return index < 0 ? _Runtime.UNDEFINED : values[index];
    #end
  }

  public static inline function writeUint8ClampedArray(source:Dynamic, key:Dynamic, value:Dynamic):Dynamic {
    #if js
    js.Syntax.code('{0}[{1}] = {2}', source, key, value);
    #else
    (cast source : _UInt8ClampedArray)[Std.int(key)] = value;
    #end
    return value;
  }
}
