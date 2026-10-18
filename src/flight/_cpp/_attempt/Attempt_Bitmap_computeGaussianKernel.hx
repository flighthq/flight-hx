// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/bitmap/contract.hpp")
extern class Attempt_Bitmap_computeGaussianKernel extends AttemptConfig {
  @:native("flight::bitmap::compute_gaussian_kernel")
  public static function computeGaussianKernel(out:flight._internal._Float32Array, radius:Float, sigma:Float):Void;
}
#end
