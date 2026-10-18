// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/bitmap/contract.hpp")
extern class Attempt_Bitmap_convertBitmapAlphaType extends AttemptConfig {
  @:native("flight::bitmap::convert_bitmap_alpha_type")
  public static function convertBitmapAlphaType(out:flight.Bitmap, target:flight.AlphaType):Void;
}
#end
