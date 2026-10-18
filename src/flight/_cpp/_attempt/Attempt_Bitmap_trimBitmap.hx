// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/bitmap/contract.hpp")
extern class Attempt_Bitmap_trimBitmap extends AttemptConfig {
  @:native("flight::bitmap::trim_bitmap")
  public static function trimBitmap(source:flight.Bitmap):flight.Bitmap;
}
#end
