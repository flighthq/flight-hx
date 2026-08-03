// Maintained runtime support for generated Flight Haxe.
package flighthq._internal;

abstract _UInt8Array(Dynamic) {
  public var length(get, never):Int;

  public function new(source:Dynamic = 0, ?byteOffset:Int, ?length:Int) {
    #if js
    this = byteOffset == null
      ? js.Syntax.code('new Uint8Array({0})', source)
      : length == null
        ? js.Syntax.code('new Uint8Array({0}, {1})', source, byteOffset)
        : js.Syntax.code('new Uint8Array({0}, {1}, {2})', source, byteOffset, length);
    #elseif lime
    this = new _LimeTypedArray('uint8', source, byteOffset, length);
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
      this = [for (value in values) Std.int(value) & 0xff];
    }
    #end
  }

  @:arrayAccess public inline function arrayRead(index:Int):Int {
    #if (lime && !js)
    return (cast this : _LimeTypedArray).get(index);
    #else
    return this[index];
    #end
  }

  @:arrayAccess public inline function arrayWrite(index:Int, value:Int):Int {
    #if (lime && !js)
    return (cast this : _LimeTypedArray).setValue(index, value);
    #else
    return this[index] = value & 0xff;
    #end
  }

  public function fill(value:Int, start = 0, ?end:Int):_UInt8Array {
    #if (lime && !js)
    (cast this : _LimeTypedArray).fill(value, start, end);
    #else
    final stop = end == null ? length : end;
    for (index in start...stop) this[index] = value & 0xff;
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

  public function subarray(?begin:Int, ?end:Int):_UInt8Array {
    final start = begin == null ? 0 : begin;
    final stop = end == null ? length : end;
    #if js
    return cast js.Syntax.code('{0}.subarray({1}, {2})', this, start, stop);
    #elseif lime
    return cast (cast this : _LimeTypedArray).subarray(start, stop);
    #else
    return new _UInt8Array((cast this : Array<Int>).slice(start, stop));
    #end
  }
}
