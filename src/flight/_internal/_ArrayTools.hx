package flight._internal;

/** ECMAScript Array operations whose arity differs from Haxe's Array API. */
class _ArrayTools {
  public static inline function pushMany<T>(target:Array<T>, values:Array<T>):Int {
    for (value in values) target.push(value);
    return target.length;
  }
}
