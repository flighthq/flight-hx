// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/bitmap/contract.hpp")
extern class Attempt_Bitmap_rotateBitmapClockwise extends AttemptConfig {
  @:native("flight::bitmap::rotate_bitmap_clockwise")
  public static function rotateBitmapClockwise(dest:flight.BitmapRegion, source:flight.BitmapRegion):Void;
}
#end
