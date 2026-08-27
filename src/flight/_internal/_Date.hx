// Maintained runtime support for generated Flight Haxe.
package flight._internal;

import Math as HxMath;

/** Portable ECMAScript Date subset used by scheduling and snapshot guards. */
@:keep
class _Date {
  final milliseconds:Float;

  public function new(?value:Dynamic) {
    milliseconds = value == null ? now() : dateValue(value);
  }

  public function getTime():Float return milliseconds;

  public function valueOf():Float return milliseconds;

  public static function now():Float return Date.now().getTime();

  static function dateValue(value:Dynamic):Float {
    if (Std.isOfType(value, _Date)) return (cast value : _Date).milliseconds;
    if (Std.isOfType(value, Int) || Std.isOfType(value, Float)) return cast value;
    try {
      return Date.fromString(Std.string(value)).getTime();
    } catch (_:Dynamic) {
      return HxMath.NaN;
    }
  }
}
