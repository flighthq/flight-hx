// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/bitmap/contract.hpp")
extern class Attempt_Bitmap_copyBitmapChannel extends AttemptConfig {
  @:native("flight::bitmap::copy_bitmap_channel")
  public static function copyBitmapChannel(dest:flight.BitmapRegion, destChannel:flight.ImageChannel, source:flight.BitmapRegion, sourceChannel:flight.ImageChannel):Void;
}
#end
