// Generated from flight-compiler native-planning.json. Do not edit.
package flight._internal;

// hxcpp-facing owning copy carrier. Native bridges convert this storage to the exact
// flight::TypedArray specialization and copy mutations/results back at the ABI boundary.
abstract _UInt32Array<T = Dynamic>(Array<Float>) {
  public var length(get, never):Int;

  public inline function new(length:Float) {
    this = [];
    final count = Std.int(length);
    if (count < 0 || count != length) throw 'Invalid typed array length: $length';
    for (_ in 0...count) this.push(0.0);
  }

  @:arrayAccess
  public inline function get(index:Int):Float return this[index];

  @:arrayAccess
  public inline function setAt(index:Int, value:Float):Float {
    final normalized = wrapUnsigned(value, 4294967296.0);
    this[index] = normalized;
    return normalized;
  }

  public inline function fill(value:Float, start:Int = 0, ?end:Int):_UInt32Array<T> {
    final limit = end == null ? this.length : Std.int(Math.min(this.length, end));
    var index = Std.int(Math.max(0, start));
    while (index < limit) {
      setAt(index, value);
      index += 1;
    }
    return cast this;
  }

  public inline function set(source:_UInt32Array<T>, offset:Int = 0):Void {
    for (index in 0...source.length) setAt(offset + index, source[index]);
  }

  public inline function slice(start:Int = 0, ?end:Int):_UInt32Array<T> {
    return cast this.slice(start, end);
  }

  public inline function subarray(start:Int = 0, ?end:Int):_UInt32Array<T> {
    return cast this.slice(start, end);
  }

  @:to
  public inline function toArray():Array<Float> return this;

  inline function get_length():Int return this.length;

  static inline function wrapUnsigned(value:Float, modulus:Float):Float {
    if (!Math.isFinite(value) || value == 0.0) return 0.0;
    final truncated = value < 0.0 ? Math.fceil(value) : Math.ffloor(value);
    var wrapped = truncated % modulus;
    if (wrapped < 0.0) wrapped += modulus;
    return wrapped;
  }

  static inline function clampUint8(value:Float):Float {
    if (Math.isNaN(value) || value <= 0.0) return 0.0;
    if (value >= 255.0) return 255.0;
    final lower = Math.ffloor(value);
    final fraction = value - lower;
    return fraction > 0.5 || (fraction == 0.5 && lower % 2.0 != 0.0) ? lower + 1.0 : lower;
  }
}
