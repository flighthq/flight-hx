// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/bitmap/contract.hpp")
extern class Attempt_Bitmap_applyBitmapLevels extends AttemptConfig {
  @:native("flight::bitmap::apply_bitmap_levels")
  public static function applyBitmapLevels(out:flight.BitmapRegion, source:flight.BitmapRegion, ?blackPoint:Float, ?whitePoint:Float, ?gamma:Float):Void;
}
#end
