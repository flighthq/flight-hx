// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/bitmap/contract.hpp")
extern class Attempt_Bitmap_explainBitmapEncodeFailure extends AttemptConfig {
  @:native("flight::bitmap::explain_bitmap_encode_failure")
  public static function explainBitmapEncodeFailure(hostBitmapEncode:flight.HostBitmapEncodeCapability, format:flight.ImageFormat):Null<flight.BitmapEncodeFailureExplanation>;
}
#end
