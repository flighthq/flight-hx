// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/bitmap/contract.hpp")
extern class Attempt_Bitmap_getBitmapCoverage extends AttemptConfig {
  @:native("flight::bitmap::get_bitmap_coverage")
  public static function getBitmapCoverage(source:flight.Bitmap, backgroundColor:Float, ?channelTolerance:Float):Float;
}
#end
