// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/bitmap/contract.hpp")
extern class Attempt_Bitmap_buildBitmapHueRotationColorMatrix extends AttemptConfig {
  @:native("flight::bitmap::build_bitmap_hue_rotation_color_matrix")
  public static function buildBitmapHueRotationColorMatrix(out:Array<Float>, degrees:Float):Void;
}
#end
