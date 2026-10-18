// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/bitmap/contract.hpp")
extern class Attempt_Bitmap_extractBitmapPixels32 extends AttemptConfig {
  @:native("flight::bitmap::extract_bitmap_pixels32")
  public static function extractBitmapPixels32(out:flight._internal._UInt32Array, source:flight.BitmapRegion):Void;
}
#end
