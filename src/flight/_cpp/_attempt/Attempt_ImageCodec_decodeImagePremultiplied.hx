// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight._cpp._attempt;

#if cpp
import flight.*;
@:include("flight/image_codec/contract.hpp")
extern class Attempt_ImageCodec_decodeImagePremultiplied extends AttemptConfig {
  @:native("flight::image_codec::decode_image_premultiplied")
  public static function decodeImagePremultiplied(imageDecode:flight.HostImageDecodeCapabilities, bytes:flight._internal._UInt8Array, ?mimeType:String):flight._internal._Promise<Null<flight.DecodedImage>>;
}
#end
