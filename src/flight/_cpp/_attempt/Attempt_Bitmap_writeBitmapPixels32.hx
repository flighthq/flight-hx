// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/bitmap/contract.hpp")
extern class Attempt_Bitmap_writeBitmapPixels32 extends AttemptConfig {
  @:native("flight::bitmap::write_bitmap_pixels32")
  public static function writeBitmapPixels32(dest:flight.BitmapRegion, pixels:flight._internal._UInt32Array):Void;
}
#end
