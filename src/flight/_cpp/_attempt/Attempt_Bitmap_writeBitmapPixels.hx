// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/bitmap/contract.hpp")
extern class Attempt_Bitmap_writeBitmapPixels extends AttemptConfig {
  @:native("flight::bitmap::write_bitmap_pixels")
  public static function writeBitmapPixels(dest:flight.BitmapRegion, pixels:flight._internal._UInt8ClampedArray):Void;
}
#end
