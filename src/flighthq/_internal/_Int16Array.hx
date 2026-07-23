// Maintained runtime support for generated Flight Haxe.
package flighthq._internal;

abstract _Int16Array(Dynamic) {
  public var length(get, never):Int;

  public function new(source:Dynamic = 0) {
    #if js
    this = js.Syntax.code('new Int16Array({0})', source);
    #else
    if (Std.isOfType(source, Int) || Std.isOfType(source, Float)) {
      this = [for (_ in 0...Std.int(source)) 0];
    } else {
      final values:Array<Dynamic> = _Runtime.iterable(source);
      this = [for (value in values) toInt16(value)];
    }
    #end
  }

  @:arrayAccess public inline function arrayRead(index:Int):Int {
    return this[index];
  }

  @:arrayAccess public inline function arrayWrite(index:Int, value:Dynamic):Int {
    return this[index] = toInt16(value);
  }

  public function fill(value:Int, start = 0, ?end:Int):_Int16Array {
    final stop = end == null ? length : end;
    for (index in start...stop) this[index] = toInt16(value);
    return cast this;
  }

  private inline function get_length():Int {
    return this.length;
  }

  public function set(source:Dynamic, offset:Float = 0):Void {
    final start = Std.int(offset);
    final values:Array<Dynamic> = _Runtime.iterable(source);
    for (index in 0...values.length) this[start + index] = values[index];
  }

  public function subarray(?begin:Int, ?end:Int):_Int16Array {
    final start = begin == null ? 0 : begin;
    final stop = end == null ? length : end;
    #if js
    return cast js.Syntax.code('{0}.subarray({1}, {2})', this, start, stop);
    #else
    return new _Int16Array((cast this : Array<Int>).slice(start, stop));
    #end
  }

  private static inline function toInt16(value:Dynamic):Int {
    return (Std.int(value) << 16) >> 16;
  }
}
