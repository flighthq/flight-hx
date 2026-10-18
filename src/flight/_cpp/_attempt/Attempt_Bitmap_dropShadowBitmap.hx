// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/bitmap/contract.hpp")
extern class Attempt_Bitmap_dropShadowBitmap extends AttemptConfig {
  @:native("flight::bitmap::drop_shadow_bitmap")
  public static function dropShadowBitmap(out:flight._internal._UInt8ClampedArray, scratch:flight._internal._UInt8ClampedArray, source:flight.BitmapRegion, ?options:flight.BitmapDropShadowOptions):Void;
}
#end
