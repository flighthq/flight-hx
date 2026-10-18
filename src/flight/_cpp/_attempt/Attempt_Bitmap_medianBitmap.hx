// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/bitmap/contract.hpp")
extern class Attempt_Bitmap_medianBitmap extends AttemptConfig {
  @:native("flight::bitmap::median_bitmap")
  public static function medianBitmap(out:flight._internal._UInt8ClampedArray, source:flight.BitmapRegion, radius:Float):Void;
}
#end
