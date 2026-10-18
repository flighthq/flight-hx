// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/bitmap/contract.hpp")
extern class Attempt_Bitmap_transformBitmap extends AttemptConfig {
  @:native("flight::bitmap::transform_bitmap")
  public static function transformBitmap(dest:flight.BitmapRegion, source:flight.BitmapRegion, matrix:Array<Float>, ?edgeMode:flight.BitmapEdgeMode, ?sampleMode:flight.BitmapResizeMode):Void;
}
#end
