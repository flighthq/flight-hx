package flight._internal;

#if js
typedef _Float32Array<T = Dynamic> = js.lib.Float32Array;
#else
/** Float32-backed array semantics for host-free transpiled modules. */
abstract _Float32Array<T = Dynamic>(Array<Float>) {
  public var length(get, never):Int;

  public inline function new(length:Float) {
    this = [];
    final count = Std.int(length);
    if (count < 0) throw 'Invalid typed array length: $length';
    for (_ in 0...count) this.push(0);
  }

  @:arrayAccess
  public inline function get(index:Int):Float {
    return this[index];
  }

  @:arrayAccess
  public inline function setAt(index:Int, value:Float):Float {
    final rounded = haxe.io.FPHelper.i32ToFloat(haxe.io.FPHelper.floatToI32(value));
    this[index] = rounded;
    return rounded;
  }

  public inline function fill(value:Float, start:Int = 0, ?end:Int):_Float32Array<T> {
    final limit = end == null ? this.length : Std.int(Math.min(this.length, end));
    var index = Std.int(Math.max(0, start));
    while (index < limit) {
      setAt(index, value);
      index += 1;
    }
    return cast this;
  }

  public inline function set(source:_Float32Array<T>, offset:Int = 0):Void {
    for (index in 0...source.length) setAt(offset + index, source[index]);
  }

  public inline function slice(start:Int = 0, ?end:Int):_Float32Array<T> {
    return cast this.slice(start, end);
  }

  public inline function subarray(start:Int = 0, ?end:Int):_Float32Array<T> {
    return cast this.slice(start, end);
  }

  @:to
  public inline function toArray():Array<Float> {
    return this;
  }

  inline function get_length():Int {
    return this.length;
  }
}
#end
