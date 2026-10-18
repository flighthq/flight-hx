// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/image_codec/contract.hpp")
extern class Attempt_ImageCodec_encodeImage extends AttemptConfig {
  @:native("flight::image_codec::encode_image")
  public static function encodeImage(imageEncode:flight.HostImageEncodeCapabilities, image:flight.DecodedImage, mimeType:String, ?options:flight.ImageEncodeOptions):flight._internal._Promise<Null<flight._internal._UInt8Array>>;
}
#end
