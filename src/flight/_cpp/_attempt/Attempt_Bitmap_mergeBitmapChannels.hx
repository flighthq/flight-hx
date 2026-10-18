// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/bitmap/contract.hpp")
extern class Attempt_Bitmap_mergeBitmapChannels extends AttemptConfig {
  @:native("flight::bitmap::merge_bitmap_channels")
  public static function mergeBitmapChannels(out:flight.BitmapRegion, r:flight.BitmapRegion, g:flight.BitmapRegion, b:flight.BitmapRegion, a:flight.BitmapRegion):Void;
}
#end
