// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/bitmap/contract.hpp")
extern class Attempt_Bitmap_floodFillBitmap extends AttemptConfig {
  @:native("flight::bitmap::flood_fill_bitmap")
  public static function floodFillBitmap(out:flight.Bitmap, x:Float, y:Float, color:Float):Void;
}
#end
