// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/bitmap/contract.hpp")
extern class Attempt_Bitmap_parseBitmapFingerprint extends AttemptConfig {
  @:native("flight::bitmap::parse_bitmap_fingerprint")
  public static function parseBitmapFingerprint(text:String):Null<flight.BitmapFingerprint>;
}
#end
