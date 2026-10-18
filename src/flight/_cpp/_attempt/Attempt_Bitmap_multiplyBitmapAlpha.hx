// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/bitmap/contract.hpp")
extern class Attempt_Bitmap_multiplyBitmapAlpha extends AttemptConfig {
  @:native("flight::bitmap::multiply_bitmap_alpha")
  public static function multiplyBitmapAlpha(out:flight.BitmapRegion, factor:Float):Void;
}
#end
