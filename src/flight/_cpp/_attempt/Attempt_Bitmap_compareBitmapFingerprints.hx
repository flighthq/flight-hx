// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/bitmap/contract.hpp")
extern class Attempt_Bitmap_compareBitmapFingerprints extends AttemptConfig {
  @:native("flight::bitmap::compare_bitmap_fingerprints")
  public static function compareBitmapFingerprints(a:flight.BitmapFingerprint, b:flight.BitmapFingerprint):Float;
}
#end
