// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/bitmap/contract.hpp")
extern class Attempt_Bitmap_fillBitmapNoise extends AttemptConfig {
  @:native("flight::bitmap::fill_bitmap_noise")
  public static function fillBitmapNoise(dest:flight.BitmapRegion, seed:Float, ?low:Float, ?high:Float, ?grayScale:Bool):Void;
}
#end
