// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/bitmap/contract.hpp")
extern class Attempt_Bitmap_glowBitmap extends AttemptConfig {
  @:native("flight::bitmap::glow_bitmap")
  public static function glowBitmap(out:flight._internal._UInt8ClampedArray, scratch:flight._internal._UInt8ClampedArray, source:flight.BitmapRegion, ?options:flight.BitmapGlowOptions):Void;
}
#end
