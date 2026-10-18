// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/bitmap/contract.hpp")
extern class Attempt_Bitmap_rotateBitmapCounterClockwise extends AttemptConfig {
  @:native("flight::bitmap::rotate_bitmap_counter_clockwise")
  public static function rotateBitmapCounterClockwise(dest:flight.BitmapRegion, source:flight.BitmapRegion):Void;
}
#end
