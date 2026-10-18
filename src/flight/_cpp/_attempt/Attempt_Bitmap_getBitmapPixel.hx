// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/bitmap/contract.hpp")
extern class Attempt_Bitmap_getBitmapPixel extends AttemptConfig {
  @:native("flight::bitmap::get_bitmap_pixel")
  public static function getBitmapPixel(source:flight.Bitmap, x:Float, y:Float):Float;
}
#end
