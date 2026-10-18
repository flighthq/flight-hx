// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/bitmap/contract.hpp")
extern class Attempt_Bitmap_createBitmapFingerprint extends AttemptConfig {
  @:native("flight::bitmap::create_bitmap_fingerprint")
  public static function createBitmapFingerprint(source:flight.Bitmap, ?gridSize:Float):flight.BitmapFingerprint;
}
#end
