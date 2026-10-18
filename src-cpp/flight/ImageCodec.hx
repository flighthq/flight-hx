// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight;

extern inline function decodeImage(imageDecode:flight.HostImageDecodeCapabilities, bytes:flight._internal._UInt8Array, ?mimeType:String):flight._internal._Promise<Null<flight.DecodedImage>> {
  return flight._cpp._attempt.Attempt_ImageCodec_decodeImage.decodeImage(imageDecode, bytes, mimeType);
}

extern inline function decodeImagePremultiplied(imageDecode:flight.HostImageDecodeCapabilities, bytes:flight._internal._UInt8Array, ?mimeType:String):flight._internal._Promise<Null<flight.DecodedImage>> {
  return flight._cpp._attempt.Attempt_ImageCodec_decodeImagePremultiplied.decodeImagePremultiplied(imageDecode, bytes, mimeType);
}

extern inline function detectImageMimeType(data:Dynamic):Null<String> {
  return flight._cpp._attempt.Attempt_ImageCodec_detectImageMimeType.detectImageMimeType(data);
}

extern inline function encodeImage(imageEncode:flight.HostImageEncodeCapabilities, image:flight.DecodedImage, mimeType:String, ?options:flight.ImageEncodeOptions):flight._internal._Promise<Null<flight._internal._UInt8Array>> {
  return flight._cpp._attempt.Attempt_ImageCodec_encodeImage.encodeImage(imageEncode, image, mimeType, options);
}
