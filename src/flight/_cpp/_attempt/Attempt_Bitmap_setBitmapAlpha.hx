// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/bitmap/contract.hpp")
extern class Attempt_Bitmap_setBitmapAlpha extends AttemptConfig {
  @:native("flight::bitmap::set_bitmap_alpha")
  public static function setBitmapAlpha(out:flight.BitmapRegion, alpha:Float):Void;
}
#end
