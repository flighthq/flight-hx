// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/bitmap/contract.hpp")
extern class Attempt_Bitmap_getBitmapPixelRgb extends AttemptConfig {
  @:native("flight::bitmap::get_bitmap_pixel_rgb")
  public static function getBitmapPixelRgb(source:flight.Bitmap, x:Float, y:Float):Float;
}
#end
