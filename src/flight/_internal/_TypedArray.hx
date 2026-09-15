package flight._internal;

/** Typed-array operations emitted as runtime calls by flight-compiler. */
class _TypedArray {
  public static inline function copyWithin<T>(value:T, target:Int, start:Int, ?end:Int):T {
    #if js
    return js.Syntax.code("{0}.copyWithin({1}, {2}, {3})", value, target, start, end);
    #else
    return cast _Array.copyWithin(cast value, target, start, end);
    #end
  }
}
