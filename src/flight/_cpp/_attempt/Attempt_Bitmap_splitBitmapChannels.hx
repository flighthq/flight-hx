// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/bitmap/contract.hpp")
extern class Attempt_Bitmap_splitBitmapChannels extends AttemptConfig {
  @:native("flight::bitmap::split_bitmap_channels")
  public static function splitBitmapChannels(source:flight.Bitmap):Array<flight.Bitmap>;
}
#end
