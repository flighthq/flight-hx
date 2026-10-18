// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/bitmap/contract.hpp")
extern class Attempt_Bitmap_createBitmap extends AttemptConfig {
  @:native("flight::bitmap::create_bitmap")
  public static function createBitmap(width:Float, height:Float, ?color:Float):flight.Bitmap;
}
#end
