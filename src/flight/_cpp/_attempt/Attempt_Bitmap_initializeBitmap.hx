// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/bitmap/contract.hpp")
extern class Attempt_Bitmap_initializeBitmap extends AttemptConfig {
  @:native("flight::bitmap::initialize_bitmap")
  public static function initializeBitmap(out:flight.EntityConstruction<flight.Bitmap>, alphaType:flight.AlphaType, data:flight._internal._UInt8ClampedArray<flight._internal._ArrayBuffer>, format:flight.PixelFormat, gamut:Dynamic, height:Float, width:Float):Void;
}
#end
