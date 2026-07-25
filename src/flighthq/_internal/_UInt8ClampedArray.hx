// Maintained runtime support for generated Flight Haxe.
package flighthq._internal;

abstract _UInt8ClampedArray(Dynamic) {
  public var length(get, never):Int;

  public function new(source:Dynamic = 0, ?byteOffset:Int, ?length:Int) {
    #if js
    this = byteOffset == null
      ? js.Syntax.code('new Uint8ClampedArray({0})', source)
      : length == null
        ? js.Syntax.code('new Uint8ClampedArray({0}, {1})', source, byteOffset)
        : js.Syntax.code('new Uint8ClampedArray({0}, {1}, {2})', source, byteOffset, length);
    #elseif lime
    this = new _LimeTypedArray('uint8clamped', source, byteOffset, length);
    #else
    if (Std.isOfType(source, Int) || Std.isOfType(source, Float)) {
      this = [for (_ in 0...Std.int(source)) 0];
    } else if (Std.isOfType(source, haxe.io.Bytes)) {
      final bytes:haxe.io.Bytes = cast source;
      final start = byteOffset == null ? 0 : byteOffset;
      final stop = length == null ? bytes.length : start + length;
      this = [for (index in start...stop) bytes.get(index)];
    } else {
      final values:Array<Dynamic> = _Runtime.iterable(source);
      this = [for (value in values) clamp(value)];
    }
    #end
  }

  /** Factory for reflective construction sites (`new Uint8ClampedArray(...)`
   * reached through `_Runtime.globalValue`); abstracts have no runtime class
   * for `Type.createInstance`. */
  public static function construct(source:Dynamic = 0, ?byteOffset:Int, ?length:Int):_UInt8ClampedArray {
    return new _UInt8ClampedArray(source, byteOffset, length);
  }

  static inline function clamp(value:Dynamic):Int {
    final rounded = Math.round(value);
    return rounded < 0 ? 0 : rounded > 255 ? 255 : Std.int(rounded);
  }

  @:arrayAccess public inline function arrayRead(index:Int):Int {
    #if (lime && !js)
    return (cast this : _LimeTypedArray).get(index);
    #else
    return this[index];
    #end
  }

  @:arrayAccess public inline function arrayWrite(index:Int, value:Float):Int {
    #if (lime && !js)
    return (cast this : _LimeTypedArray).setValue(index, value);
    #elseif js
    js.Syntax.code('{0}[{1}] = {2}', this, index, value);
    return this[index];
    #else
    return this[index] = clamp(value);
    #end
  }

  public function fill(value:Float, start = 0, ?end:Int):_UInt8ClampedArray {
    #if (lime && !js)
    (cast this : _LimeTypedArray).fill(value, start, end);
    #else
    final stop = end == null ? length : end;
    for (index in start...stop) arrayWrite(index, value);
    #end
    return cast this;
  }

  private inline function get_length():Int {
    #if (lime && !js)
    return (cast this : _LimeTypedArray).length;
    #else
    return this.length;
    #end
  }

  public function set(source:Dynamic, offset:Float = 0):Void {
    final start = Std.int(offset);
    #if (lime && !js)
    final target:_LimeTypedArray = cast this;
    final sourceArray = Std.isOfType(source, _LimeTypedArray) ? (cast source : _LimeTypedArray) : null;
    if (sourceArray != null) {
      for (index in 0...sourceArray.length) target.setValue(start + index, sourceArray.get(index));
      return;
    }
    #end
    final values:Array<Dynamic> = _Runtime.iterable(source);
    for (index in 0...values.length) arrayWrite(start + index, values[index]);
  }

  public function subarray(?begin:Int, ?end:Int):_UInt8ClampedArray {
    final start = begin == null ? 0 : begin;
    final stop = end == null ? length : end;
    #if js
    return cast js.Syntax.code('{0}.subarray({1}, {2})', this, start, stop);
    #elseif lime
    return cast (cast this : _LimeTypedArray).subarray(start, stop);
    #else
    return new _UInt8ClampedArray((cast this : Array<Int>).slice(start, stop));
    #end
  }
}
