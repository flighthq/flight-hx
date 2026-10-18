// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/bitmap/contract.hpp")
extern class Attempt_Bitmap_rotateBitmap extends AttemptConfig {
  @:native("flight::bitmap::rotate_bitmap")
  public static function rotateBitmap(dest:flight.BitmapRegion, source:flight.BitmapRegion, angle:Float, ?pivotX:Float, ?pivotY:Float, ?edgeMode:flight.BitmapEdgeMode, ?sampleMode:flight.BitmapResizeMode):Void;
}
#end
