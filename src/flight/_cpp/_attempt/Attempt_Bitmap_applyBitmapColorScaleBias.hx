// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/bitmap/contract.hpp")
extern class Attempt_Bitmap_applyBitmapColorScaleBias extends AttemptConfig {
  @:native("flight::bitmap::apply_bitmap_color_scale_bias")
  public static function applyBitmapColorScaleBias(dest:flight.BitmapRegion, source:flight.BitmapRegion, ct:flight.ColorScaleBiasLike):Void;
}
#end
