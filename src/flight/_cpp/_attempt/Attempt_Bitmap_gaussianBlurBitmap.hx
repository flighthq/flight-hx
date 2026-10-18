// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/bitmap/contract.hpp")
extern class Attempt_Bitmap_gaussianBlurBitmap extends AttemptConfig {
  @:native("flight::bitmap::gaussian_blur_bitmap")
  public static function gaussianBlurBitmap(out:flight._internal._UInt8ClampedArray, scratch:flight._internal._UInt8ClampedArray, source:flight.BitmapRegion, sigmaX:Float, ?sigmaY:Float, ?passes:Float):Void;
}
#end
