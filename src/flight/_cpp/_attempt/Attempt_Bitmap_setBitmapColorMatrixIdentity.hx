// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/bitmap/contract.hpp")
extern class Attempt_Bitmap_setBitmapColorMatrixIdentity extends AttemptConfig {
  @:native("flight::bitmap::set_bitmap_color_matrix_identity")
  public static function setBitmapColorMatrixIdentity(out:Array<Float>):Void;
}
#end
