// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/bitmap/contract.hpp")
extern class Attempt_Bitmap_applyBitmapThreshold extends AttemptConfig {
  @:native("flight::bitmap::apply_bitmap_threshold")
  public static function applyBitmapThreshold(dest:flight.BitmapRegion, source:flight.BitmapRegion, operation:flight.ThresholdOperation, thresholdValue:Float, ?color:Float, ?mask:Float, ?copySource:Bool):Float;
}
#end
