// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/bitmap/contract.hpp")
extern class Attempt_Bitmap_unpremultiplyBitmapPixels extends AttemptConfig {
  @:native("flight::bitmap::unpremultiply_bitmap_pixels")
  public static function unpremultiplyBitmapPixels(out:flight._internal._UInt8ClampedArray, source:flight._internal._UInt8ClampedArray, length:Float):Void;
}
#end
