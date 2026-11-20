package flight.esm;

#if (js && flight_esm)
@:jsRequire("@flighthq/image-codec")
extern class ImageCodec {
  public static function decodeImage(imageDecode:flight.esm.types.image_codec_contract.Types.HostImageDecodeCapabilities, bytes:js.lib.Uint8Array, ?mimeType:Null<String>):js.lib.Promise<Null<flight.esm.types.image_codec_contract.Types.DecodedImage>>;
  public static function decodeImagePremultiplied(imageDecode:flight.esm.types.image_codec_contract.Types.HostImageDecodeCapabilities, bytes:js.lib.Uint8Array, ?mimeType:Null<String>):js.lib.Promise<Null<flight.esm.types.image_codec_contract.Types.DecodedImage>>;
  public static function detectImageMimeType(data:Dynamic):Null<String>;
  public static function encodeImage(imageEncode:flight.esm.types.image_codec_contract.Types.HostImageEncodeCapabilities, image:flight.esm.types.image_codec_contract.Types.DecodedImage, mimeType:String, ?options:Null<flight.esm.types.image_codec_contract.Types.ImageEncodeOptions>):js.lib.Promise<Null<js.lib.Uint8Array>>;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
