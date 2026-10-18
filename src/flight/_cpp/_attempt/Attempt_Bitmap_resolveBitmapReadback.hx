// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/bitmap/contract.hpp")
extern class Attempt_Bitmap_resolveBitmapReadback extends AttemptConfig {
  @:native("flight::bitmap::resolve_bitmap_readback")
  public static function resolveBitmapReadback(hostBitmapReadback:flight.HostBitmapReadbackCapability, source:flight.HostImageSource, width:Float, height:Float, mode:flight.BitmapReadbackMode):{ bitmap:Null<flight.Bitmap>, reason:flight.BitmapReadbackBlockReason };
}
#end
