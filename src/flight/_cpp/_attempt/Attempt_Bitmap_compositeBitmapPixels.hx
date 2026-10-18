// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/bitmap/contract.hpp")
extern class Attempt_Bitmap_compositeBitmapPixels extends AttemptConfig {
  @:native("flight::bitmap::composite_bitmap_pixels")
  public static function compositeBitmapPixels(dest:flight.BitmapRegion, pixels:flight._internal._UInt8ClampedArray, ?mode:flight.BitmapCompositeMode):Void;
}
#end
