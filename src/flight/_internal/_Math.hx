package flight._internal;

import Math as HaxeMath;

/** Stable route to Haxe's root Math type, which would otherwise collide with flight.Math. */
class _Math {
  public static final PI:Float = HaxeMath.PI;

  public static inline function abs(value:Float):Float {
    return HaxeMath.abs(value);
  }

  public static inline function acos(value:Float):Float {
    return HaxeMath.acos(value);
  }

  public static inline function asin(value:Float):Float {
    return HaxeMath.asin(value);
  }

  public static inline function ceil(value:Float):Int {
    return HaxeMath.ceil(value);
  }

  public static inline function cos(value:Float):Float {
    return HaxeMath.cos(value);
  }

  public static inline function exp(value:Float):Float {
    return HaxeMath.exp(value);
  }

  public static inline function ffloor(value:Float):Float {
    return HaxeMath.ffloor(value);
  }

  public static inline function floor(value:Float):Int {
    return HaxeMath.floor(value);
  }

  public static inline function fround(value:Float):Float {
    return HaxeMath.fround(value);
  }

  public static inline function isFinite(value:Float):Bool {
    return HaxeMath.isFinite(value);
  }

  public static inline function log(value:Float):Float {
    return HaxeMath.log(value);
  }

  public static inline function log2(value:Float):Float {
    return HaxeMath.log(value) / HaxeMath.log(2);
  }

  public static inline function max(left:Float, right:Float):Float {
    return HaxeMath.max(left, right);
  }

  public static inline function min(left:Float, right:Float):Float {
    return HaxeMath.min(left, right);
  }

  public static inline function pow(value:Float, power:Float):Float {
    return HaxeMath.pow(value, power);
  }

  public static inline function round(value:Float):Int {
    return HaxeMath.round(value);
  }

  public static inline function sign(value:Float):Float {
    if (HaxeMath.isNaN(value) || value == 0) return value;
    return value < 0 ? -1 : 1;
  }

  public static inline function sin(value:Float):Float {
    return HaxeMath.sin(value);
  }

  public static inline function sqrt(value:Float):Float {
    return HaxeMath.sqrt(value);
  }

  public static inline function trunc(value:Float):Float {
    return value < 0 ? HaxeMath.ceil(value) : HaxeMath.floor(value);
  }
}
