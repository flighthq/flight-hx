package flight._internal;

/** ECMAScript Math operations absent from Haxe's cross-target Math surface. */
class _Math {
  public static inline function log2(value:Float):Float {
    return Math.log(value) / Math.log(2);
  }

  public static inline function sign(value:Float):Float {
    if (Math.isNaN(value) || value == 0) return value;
    return value < 0 ? -1 : 1;
  }

  public static inline function trunc(value:Float):Float {
    return value < 0 ? Math.ceil(value) : Math.floor(value);
  }
}
