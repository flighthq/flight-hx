// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/bitmap/contract.hpp")
extern class Attempt_Bitmap_invalidateBitmap extends AttemptConfig {
  @:native("flight::bitmap::invalidate_bitmap")
  public static function invalidateBitmap(bitmap:flight.Bitmap):Void;
}
#end
