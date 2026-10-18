// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/bitmap/contract.hpp")
extern class Attempt_Bitmap_cloneBitmap extends AttemptConfig {
  @:native("flight::bitmap::clone_bitmap")
  public static function cloneBitmap(source:flight.Bitmap):flight.Bitmap;
}
#end
