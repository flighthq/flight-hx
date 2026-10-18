// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/bitmap/contract.hpp")
extern class Attempt_Bitmap_fillBitmapTurbulence extends AttemptConfig {
  @:native("flight::bitmap::fill_bitmap_turbulence")
  public static function fillBitmapTurbulence(dest:flight.BitmapRegion, baseX:Float, baseY:Float, octaves:Float, seed:Float, ?grayScale:Bool, ?stitch:Bool, ?channelOptions:Float):Void;
}
#end
