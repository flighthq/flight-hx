// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/bitmap/contract.hpp")
extern class Attempt_Bitmap_buildBitmapGradientRamp extends AttemptConfig {
  @:native("flight::bitmap::build_bitmap_gradient_ramp")
  public static function buildBitmapGradientRamp(out:flight._internal._UInt8ClampedArray, colors:Array<Float>, alphas:Array<Float>, ratios:Array<Float>):Void;
}
#end
