// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/bitmap/contract.hpp")
extern class Attempt_Bitmap_pixelateBitmap extends AttemptConfig {
  @:native("flight::bitmap::pixelate_bitmap")
  public static function pixelateBitmap(out:flight._internal._UInt8ClampedArray, source:flight.BitmapRegion, blockSize:Float):Void;
}
#end
