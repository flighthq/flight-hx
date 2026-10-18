// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/bitmap/contract.hpp")
extern class Attempt_Bitmap_fillBitmapLinearGradient extends AttemptConfig {
  @:native("flight::bitmap::fill_bitmap_linear_gradient")
  public static function fillBitmapLinearGradient(dest:flight.BitmapRegion, ramp:flight._internal._UInt8ClampedArray, x0:Float, y0:Float, x1:Float, y1:Float, ?spread:flight.GradientSpread):Void;
}
#end
