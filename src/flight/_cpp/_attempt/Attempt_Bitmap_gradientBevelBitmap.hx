// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/bitmap/contract.hpp")
extern class Attempt_Bitmap_gradientBevelBitmap extends AttemptConfig {
  @:native("flight::bitmap::gradient_bevel_bitmap")
  public static function gradientBevelBitmap(out:flight._internal._UInt8ClampedArray, scratch:flight._internal._UInt8ClampedArray, source:flight.BitmapRegion, ramp:flight._internal._UInt8ClampedArray, ?options:flight.BitmapGradientBevelOptions):Void;
}
#end
