// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/bitmap/contract.hpp")
extern class Attempt_Bitmap_initializeBitmapFingerprint extends AttemptConfig {
  @:native("flight::bitmap::initialize_bitmap_fingerprint")
  public static function initializeBitmapFingerprint(out:flight.EntityConstruction<flight.BitmapFingerprint>, gridSize:Float, cells:flight._internal._UInt8Array):Void;
}
#end
