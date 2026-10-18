// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/bitmap/contract.hpp")
extern class Attempt_Bitmap_convertBitmapPixelOrder extends AttemptConfig {
  @:native("flight::bitmap::convert_bitmap_pixel_order")
  public static function convertBitmapPixelOrder(out:flight._internal._UInt8ClampedArray, source:flight._internal._UInt8ClampedArray, length:Float, from:flight.PixelOrder, to:flight.PixelOrder):Void;
}
#end
