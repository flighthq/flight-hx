// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/bitmap/contract.hpp")
extern class Attempt_Bitmap_compareBitmap extends AttemptConfig {
  @:native("flight::bitmap::compare_bitmap")
  public static function compareBitmap(source:flight.Bitmap, other:flight.Bitmap):Null<flight.Bitmap>;
}
#end
