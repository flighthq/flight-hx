// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/bitmap/contract.hpp")
extern class Attempt_Bitmap_warpBitmapQuad extends AttemptConfig {
  @:native("flight::bitmap::warp_bitmap_quad")
  public static function warpBitmapQuad(dest:flight.BitmapRegion, source:flight.BitmapRegion, dstQuad:Array<Float>, ?edgeMode:flight.BitmapEdgeMode, ?sampleMode:flight.BitmapResizeMode):Void;
}
#end
