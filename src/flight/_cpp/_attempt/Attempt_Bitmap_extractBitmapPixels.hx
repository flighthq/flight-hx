// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/bitmap/contract.hpp")
extern class Attempt_Bitmap_extractBitmapPixels extends AttemptConfig {
  @:native("flight::bitmap::extract_bitmap_pixels")
  public static function extractBitmapPixels(out:flight._internal._UInt8ClampedArray, source:flight.BitmapRegion):Void;
}
#end
