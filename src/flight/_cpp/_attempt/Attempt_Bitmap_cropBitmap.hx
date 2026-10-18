// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/bitmap/contract.hpp")
extern class Attempt_Bitmap_cropBitmap extends AttemptConfig {
  @:native("flight::bitmap::crop_bitmap")
  public static function cropBitmap(source:flight.Bitmap, rect:flight.RectangleLike):flight.Bitmap;
}
#end
