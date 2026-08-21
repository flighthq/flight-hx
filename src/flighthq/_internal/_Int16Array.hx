// Maintained runtime support for generated Flight Haxe.
package flighthq._internal;

#if js
abstract _Int16Array(Dynamic) {
#elseif lime
abstract _Int16Array(_LimeTypedArray) {
#else
abstract _Int16Array(Array<Int>) {
#end
  public var length(get, never):Int;

  public function new(source:Dynamic = 0, ?byteOffset:Int, ?length:Int) {
    #if js
    this = byteOffset == null
      ? js.Syntax.code('new Int16Array({0})', source)
      : length == null
        ? js.Syntax.code('new Int16Array({0}, {1})', source, byteOffset)
        : js.Syntax.code('new Int16Array({0}, {1}, {2})', source, byteOffset, length);
    #elseif lime
    this = new _LimeTypedArray('int16', source, byteOffset, length);
    #else
    if (Std.isOfType(source, Int) || Std.isOfType(source, Float)) {
      this = [for (_ in 0...Std.int(source)) 0];
    } else {
      final values:Array<Dynamic> = _Runtime.iterable(source);
      this = [for (value in values) toInt16(value)];
    }
    #end
  }

  /** Factory for reflective construction through `_HostValueLut`. */
  public static function construct(source:Dynamic = 0, ?byteOffset:Int, ?length:Int):_Int16Array {
    return new _Int16Array(source, byteOffset, length);
  }

  @:arrayAccess public inline function arrayRead(index:Int):Int {
    #if (lime && !js)
    final values:lime.utils.Int16Array = cast this.nativeView;
    return values[index];
    #else
    return this[index];
    #end
  }

  @:arrayAccess public inline function arrayWrite(index:Int, value:Float):Int {
    #if (lime && !js)
    final values:lime.utils.Int16Array = cast this.nativeView;
    return values[index] = toInt16(value);
    #else
    return this[index] = toInt16(value);
    #end
  }

  public function fill(value:Int, start = 0, ?end:Int):_Int16Array {
    #if (lime && !js)
    (cast this : _LimeTypedArray).fill(toInt16(value), start, end);
    #else
    final stop = end == null ? length : end;
    for (index in start...stop) this[index] = toInt16(value);
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
    // Delegate to the storage class: it blits bit-compatible copies and keeps
    // the element-conversion loop for everything else.
    (cast this : _LimeTypedArray).set(source, start);
    return;
    #end
    final values:Array<Dynamic> = _Runtime.iterable(source);
    for (index in 0...values.length) arrayWrite(start + index, values[index]);
  }

  public function subarray(?begin:Int, ?end:Int):_Int16Array {
    final start = begin == null ? 0 : begin;
    final stop = end == null ? length : end;
    #if js
    return cast js.Syntax.code('{0}.subarray({1}, {2})', this, start, stop);
    #elseif lime
    return cast (cast this : _LimeTypedArray).subarray(start, stop);
    #else
    return new _Int16Array((cast this : Array<Int>).slice(start, stop));
    #end
  }

  private static inline function toInt16(value:Float):Int {
    final wrapped = _Runtime.toInt32(value) & 0xffff;
    return wrapped >= 0x8000 ? wrapped - 0x10000 : wrapped;
  }
}
