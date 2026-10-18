// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/bitmap/contract.hpp")
extern class Attempt_Bitmap_extendBitmap extends AttemptConfig {
  @:native("flight::bitmap::extend_bitmap")
  public static function extendBitmap(source:flight.Bitmap, left:Float, top:Float, right:Float, bottom:Float, ?edgeMode:flight.BitmapEdgeMode, ?fillColor:Float):flight.Bitmap;
}
#end
