// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/bitmap/contract.hpp")
extern class Attempt_Bitmap_setBitmapRegion extends AttemptConfig {
  @:native("flight::bitmap::set_bitmap_region")
  public static function setBitmapRegion(out:flight.BitmapRegion, bitmap:flight.Bitmap, ?x:Float, ?y:Float, ?width:Float, ?height:Float):flight.BitmapRegion;
}
#end
