// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/bitmap/contract.hpp")
extern class Attempt_Bitmap_resizeBitmap extends AttemptConfig {
  @:native("flight::bitmap::resize_bitmap")
  public static function resizeBitmap(dest:flight.BitmapRegion, source:flight.BitmapRegion, ?options:Dynamic):Void;
}
#end
