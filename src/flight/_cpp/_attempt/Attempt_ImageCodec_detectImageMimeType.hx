// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/image_codec/contract.hpp")
extern class Attempt_ImageCodec_detectImageMimeType extends AttemptConfig {
  @:native("flight::image_codec::detect_image_mime_type")
  public static function detectImageMimeType(data:Dynamic):Null<String>;
}
#end
