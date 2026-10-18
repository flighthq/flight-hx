// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/bitmap/contract.hpp")
extern class Attempt_Bitmap_mergeBitmap extends AttemptConfig {
  @:native("flight::bitmap::merge_bitmap")
  public static function mergeBitmap(dest:flight.BitmapRegion, source:flight.BitmapRegion, redScale:Float, greenScale:Float, blueScale:Float, alphaScale:Float):Void;
}
#end
