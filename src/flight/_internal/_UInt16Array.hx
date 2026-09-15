package flight._internal;

#if js
typedef _UInt16Array<T = Dynamic> = _UInt16ArrayImpl;

@:forward
abstract _UInt16ArrayImpl(js.lib.Uint16Array) from js.lib.Uint16Array to js.lib.Uint16Array {
  public inline function new(?source:Dynamic, ?byteOffset:Float, ?length:Float) {
    this = cast js.Syntax.code(
      "{2} != null ? new Uint16Array({0}, {1}, {2}) : {1} != null ? new Uint16Array({0}, {1}) : {0} == null ? new Uint16Array() : new Uint16Array({0})",
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

  public inline function fill(value:Float, start:Float = 0, ?end:Float):_UInt16ArrayImpl {
    return cast js.Syntax.code("{2} == null ? {0}.fill({1}, {3}) : {0}.fill({1}, {3}, {2})", this, value, end, start);
  }

  public inline function set(source:Dynamic, offset:Float = 0):Void {
    js.Syntax.code("{0}.set({1}, {2})", this, source, offset);
  }

  public inline function slice(start:Float = 0, ?end:Float):_UInt16ArrayImpl {
    return cast js.Syntax.code("{2} == null ? {0}.slice({1}) : {0}.slice({1}, {2})", this, start, end);
  }

  public inline function subarray(start:Float = 0, ?end:Float):_UInt16ArrayImpl {
    return cast js.Syntax.code("{2} == null ? {0}.subarray({1}) : {0}.subarray({1}, {2})", this, start, end);
  }

  public static inline function from<T>(value:Dynamic, ?map:Dynamic):_UInt16Array<T> {
    return cast js.Syntax.code("{1} == null ? Uint16Array.from({0}) : Uint16Array.from({0}, {1})", value, map);
  }
}
#else
#error "flight-compiler's transpiled SDK currently requires the JavaScript target runtime."
#end
