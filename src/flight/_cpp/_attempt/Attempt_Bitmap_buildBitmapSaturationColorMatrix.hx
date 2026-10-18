// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/bitmap/contract.hpp")
extern class Attempt_Bitmap_buildBitmapSaturationColorMatrix extends AttemptConfig {
  @:native("flight::bitmap::build_bitmap_saturation_color_matrix")
  public static function buildBitmapSaturationColorMatrix(out:Array<Float>, amount:Float):Void;
}
#end
