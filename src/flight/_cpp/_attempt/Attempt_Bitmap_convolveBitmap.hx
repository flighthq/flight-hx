// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/bitmap/contract.hpp")
extern class Attempt_Bitmap_convolveBitmap extends AttemptConfig {
  @:native("flight::bitmap::convolve_bitmap")
  public static function convolveBitmap(out:flight._internal._UInt8ClampedArray, source:flight.BitmapRegion, options:flight.BitmapConvolutionOptions):Void;
}
#end
