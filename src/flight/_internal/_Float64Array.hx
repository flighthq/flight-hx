// Maintained runtime support for generated Flight Haxe.
package flight._internal;

#if js
abstract _Float64Array(Dynamic) {
#elseif lime
abstract _Float64Array(_LimeTypedArray) {
#else
abstract _Float64Array(Array<Float>) {
#end
  public var length(get, never):Int;

  public function new(source:Dynamic = 0, ?byteOffset:Int, ?length:Int) {
    #if js
    this = byteOffset == null
      ? js.Syntax.code('new Float64Array({0})', source)
      : length == null
        ? js.Syntax.code('new Float64Array({0}, {1})', source, byteOffset)
        : js.Syntax.code('new Float64Array({0}, {1}, {2})', source, byteOffset, length);
    #elseif lime
    this = new _LimeTypedArray('float64', source, byteOffset, length);
    #else
    if (Std.isOfType(source, Int) || Std.isOfType(source, Float)) {
      this = [for (_ in 0...Std.int(source)) 0.0];
    } else {
      final values:Array<Dynamic> = _Runtime.iterable(source);
      this = [for (value in values) (value : Float)];
    }
    #end
  }

  /** Factory for reflective construction sites reached through
   * `_HostValueLut`; abstracts have no runtime class for
   * `Type.createInstance`. */
  public static function construct(source:Dynamic = 0, ?byteOffset:Int, ?length:Int):_Float64Array {
    return new _Float64Array(source, byteOffset, length);
  }

  @:arrayAccess public inline function arrayRead(index:Int):Float {
    #if (lime && !js)
    final values:lime.utils.Float64Array = cast this.nativeView;
    return values[index];
    #else
    return this[index];
    #end
  }

  @:arrayAccess public inline function arrayWrite(index:Int, value:Float):Float {
    #if (lime && !js)
    final values:lime.utils.Float64Array = cast this.nativeView;
    return values[index] = value;
    #elseif js
    js.Syntax.code('{0}[{1}] = {2}', this, index, value);
    return this[index];
    #else
    return this[index] = (value : Float);
    #end
  }

  public function fill(value:Float, start = 0, ?end:Int):_Float64Array {
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
    // Delegate to the storage class: it blits bit-compatible copies and keeps
    // the element-conversion loop for everything else.
    (cast this : _LimeTypedArray).set(source, start);
    return;
    #end
    final values:Array<Dynamic> = _Runtime.iterable(source);
    for (index in 0...values.length) arrayWrite(start + index, values[index]);
  }

  public function subarray(?begin:Int, ?end:Int):_Float64Array {
    final start = begin == null ? 0 : begin;
    final stop = end == null ? length : end;
    #if js
    return cast js.Syntax.code('{0}.subarray({1}, {2})', this, start, stop);
    #elseif lime
    return cast (cast this : _LimeTypedArray).subarray(start, stop);
    #else
    return new _Float64Array((cast this : Array<Float>).slice(start, stop));
    #end
  }
}
