// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/bitmap/contract.hpp")
extern class Attempt_Bitmap_fillBitmapRectangle extends AttemptConfig {
  @:native("flight::bitmap::fill_bitmap_rectangle")
  public static function fillBitmapRectangle(dest:flight.BitmapRegion, color:Float):Void;
}
#end
