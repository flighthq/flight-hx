package flight._internal;

#if js
@:forward
abstract _ArrayBuffer(js.lib.ArrayBuffer) from js.lib.ArrayBuffer to js.lib.ArrayBuffer {
  public inline function new(length:Int) {
    this = new js.lib.ArrayBuffer(length);
  }

  public static inline function slice(value:_ArrayBuffer, begin:Int, ?end:Int):_ArrayBuffer {
    return cast (cast value : js.lib.ArrayBuffer).slice(begin, end);
  }

  public static inline function isView(value:Dynamic):Bool {
    return js.Syntax.code("ArrayBuffer.isView({0})", value);
  }
}
#else
#error "ArrayBuffer-backed transpiled modules require a target runtime implementation."
#end
