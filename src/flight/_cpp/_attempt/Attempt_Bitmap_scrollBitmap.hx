// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/bitmap/contract.hpp")
extern class Attempt_Bitmap_scrollBitmap extends AttemptConfig {
  @:native("flight::bitmap::scroll_bitmap")
  public static function scrollBitmap(out:flight.Bitmap, dx:Float, dy:Float):Void;
}
#end
