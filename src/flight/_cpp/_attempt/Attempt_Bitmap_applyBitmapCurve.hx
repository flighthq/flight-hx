// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/bitmap/contract.hpp")
extern class Attempt_Bitmap_applyBitmapCurve extends AttemptConfig {
  @:native("flight::bitmap::apply_bitmap_curve")
  public static function applyBitmapCurve(out:flight.BitmapRegion, source:flight.BitmapRegion, redLut:Dynamic, greenLut:Dynamic, blueLut:Dynamic, ?alphaLut:Dynamic):Void;
}
#end
