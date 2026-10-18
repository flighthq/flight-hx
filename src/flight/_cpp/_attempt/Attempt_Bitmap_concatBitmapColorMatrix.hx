// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/bitmap/contract.hpp")
extern class Attempt_Bitmap_concatBitmapColorMatrix extends AttemptConfig {
  @:native("flight::bitmap::concat_bitmap_color_matrix")
  public static function concatBitmapColorMatrix(out:Array<Float>, first:Array<Float>, second:Array<Float>):Void;
}
#end
