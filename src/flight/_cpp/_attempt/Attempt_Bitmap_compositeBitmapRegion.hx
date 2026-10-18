// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/bitmap/contract.hpp")
extern class Attempt_Bitmap_compositeBitmapRegion extends AttemptConfig {
  @:native("flight::bitmap::composite_bitmap_region")
  public static function compositeBitmapRegion(dest:flight.BitmapRegion, source:flight.BitmapRegion, ?mode:flight.BitmapCompositeMode):Void;
}
#end
