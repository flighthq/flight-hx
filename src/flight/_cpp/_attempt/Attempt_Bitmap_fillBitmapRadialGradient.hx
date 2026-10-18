// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/bitmap/contract.hpp")
extern class Attempt_Bitmap_fillBitmapRadialGradient extends AttemptConfig {
  @:native("flight::bitmap::fill_bitmap_radial_gradient")
  public static function fillBitmapRadialGradient(dest:flight.BitmapRegion, ramp:flight._internal._UInt8ClampedArray, cx:Float, cy:Float, radius:Float, ?focalX:Float, ?focalY:Float, ?spread:flight.GradientSpread):Void;
}
#end
