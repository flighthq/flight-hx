// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/bitmap/contract.hpp")
extern class Attempt_Bitmap_blurBitmapPixelsHorizontal extends AttemptConfig {
  @:native("flight::bitmap::blur_bitmap_pixels_horizontal")
  public static function blurBitmapPixelsHorizontal(out:flight._internal._UInt8ClampedArray, source:flight._internal._UInt8ClampedArray, width:Float, height:Float, radius:Float):Void;
}
#end
