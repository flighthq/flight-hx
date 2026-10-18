// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/bitmap/contract.hpp")
extern class Attempt_Bitmap_createBitmapRegion extends AttemptConfig {
  @:native("flight::bitmap::create_bitmap_region")
  public static function createBitmapRegion(bitmap:flight.Bitmap, ?x:Float, ?y:Float, ?width:Float, ?height:Float):flight.BitmapRegion;
}
#end
