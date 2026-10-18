// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/bitmap/contract.hpp")
extern class Attempt_Bitmap_blurBitmapPixelsVerticalWeighted extends AttemptConfig {
  @:native("flight::bitmap::blur_bitmap_pixels_vertical_weighted")
  public static function blurBitmapPixelsVerticalWeighted(out:flight._internal._UInt8ClampedArray, source:flight._internal._UInt8ClampedArray, width:Float, height:Float, kernel:flight._internal._Float32Array):Void;
}
#end
