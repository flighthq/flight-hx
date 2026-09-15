package flight._internal;

#if js
typedef _Float32Array<T = Dynamic> = _Float32ArrayImpl;

@:forward
abstract _Float32ArrayImpl(js.lib.Float32Array) from js.lib.Float32Array to js.lib.Float32Array {
  public inline function new(?source:Dynamic, ?byteOffset:Float, ?length:Float) {
    this = cast js.Syntax.code(
      "{2} != null ? new Float32Array({0}, {1}, {2}) : {1} != null ? new Float32Array({0}, {1}) : {0} == null ? new Float32Array() : new Float32Array({0})",
      source,
      byteOffset,
      length,
    );
  }

  @:arrayAccess
  public inline function get(index:Float):Float {
    return js.Syntax.code("{0}[{1}]", this, index);
  }

  @:arrayAccess
  public inline function setAt(index:Float, value:Float):Float {
    return js.Syntax.code("{0}[{1}] = {2}", this, index, value);
  }

  public inline function fill(value:Float, start:Float = 0, ?end:Float):_Float32ArrayImpl {
    return cast js.Syntax.code("{2} == null ? {0}.fill({1}, {3}) : {0}.fill({1}, {3}, {2})", this, value, end, start);
  }

  public inline function set(source:Dynamic, offset:Float = 0):Void {
    js.Syntax.code("{0}.set({1}, {2})", this, source, offset);
  }

  public inline function slice(start:Float = 0, ?end:Float):_Float32ArrayImpl {
    return cast js.Syntax.code("{2} == null ? {0}.slice({1}) : {0}.slice({1}, {2})", this, start, end);
  }

  public inline function subarray(start:Float = 0, ?end:Float):_Float32ArrayImpl {
    return cast js.Syntax.code("{2} == null ? {0}.subarray({1}) : {0}.subarray({1}, {2})", this, start, end);
  }

  public static inline function from<T>(value:Dynamic, ?map:Dynamic):_Float32Array<T> {
    return cast js.Syntax.code("{1} == null ? Float32Array.from({0}) : Float32Array.from({0}, {1})", value, map);
  }
}
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
