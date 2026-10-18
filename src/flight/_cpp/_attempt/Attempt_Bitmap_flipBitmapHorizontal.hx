// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/bitmap/contract.hpp")
extern class Attempt_Bitmap_flipBitmapHorizontal extends AttemptConfig {
  @:native("flight::bitmap::flip_bitmap_horizontal")
  public static function flipBitmapHorizontal(dest:flight.BitmapRegion, source:flight.BitmapRegion):Void;
}
#end
