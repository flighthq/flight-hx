// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/bitmap/contract.hpp")
extern class Attempt_Bitmap_explainBitmapReadback extends AttemptConfig {
  @:native("flight::bitmap::explain_bitmap_readback")
  public static function explainBitmapReadback(hostBitmapReadback:flight.HostBitmapReadbackCapability, source:flight.HostImageSource, width:Float, height:Float):flight.BitmapReadbackExplanation;
}
#end
