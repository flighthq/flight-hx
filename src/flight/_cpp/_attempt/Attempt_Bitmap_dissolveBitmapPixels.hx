// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/bitmap/contract.hpp")
extern class Attempt_Bitmap_dissolveBitmapPixels extends AttemptConfig {
  @:native("flight::bitmap::dissolve_bitmap_pixels")
  public static function dissolveBitmapPixels(dest:flight.BitmapRegion, source:flight.BitmapRegion, seed:Float, pixelCount:Float, ?fillColor:Float):Float;
}
#end
