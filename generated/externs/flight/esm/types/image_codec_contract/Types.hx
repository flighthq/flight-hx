package flight.esm.types.image_codec_contract;

#if (js && flight_esm)
typedef DecodedImage = { data:js.lib.Uint8Array, width:Float, height:Float };

typedef HostImageDecodeCapabilities = { ?avif:Null<flight.esm.types.image_codec_contract.Types.HostImageDecodeFormatCapability>, ?bmp:Null<flight.esm.types.image_codec_contract.Types.HostImageDecodeFormatCapability>, ?gif:Null<flight.esm.types.image_codec_contract.Types.HostImageDecodeFormatCapability>, ?jpeg:Null<flight.esm.types.image_codec_contract.Types.HostImageDecodeFormatCapability>, ?png:Null<flight.esm.types.image_codec_contract.Types.HostImageDecodeFormatCapability>, ?webp:Null<flight.esm.types.image_codec_contract.Types.HostImageDecodeFormatCapability> };

typedef HostImageDecodeFormatCapability = { decode:((bytes:js.lib.Uint8Array, ?options:Null<flight.esm.types.image_codec_contract.Types.ImageDecodeOptions>) -> js.lib.Promise<flight.esm.types.image_codec_contract.Types.DecodedImage>) };

typedef HostImageEncodeCapabilities = { ?jpeg:Null<flight.esm.types.image_codec_contract.Types.HostImageEncodeFormatCapability>, ?png:Null<flight.esm.types.image_codec_contract.Types.HostImageEncodeFormatCapability>, ?webp:Null<flight.esm.types.image_codec_contract.Types.HostImageEncodeFormatCapability> };

typedef HostImageEncodeFormatCapability = { encode:((image:flight.esm.types.image_codec_contract.Types.DecodedImage, ?options:Null<flight.esm.types.image_codec_contract.Types.ImageEncodeOptions>) -> js.lib.Promise<js.lib.Uint8Array>) };

typedef ImageDecodeFallback = ((bytes:js.lib.Uint8Array, mimeType:String, ?options:Null<flight.esm.types.image_codec_contract.Types.ImageDecodeOptions>) -> js.lib.Promise<Null<flight.esm.types.image_codec_contract.Types.DecodedImage>>);

typedef ImageDecodeOptions = { ?premultiplyAlpha:Null<Bool> };

typedef ImageDecoder = ((bytes:js.lib.Uint8Array, ?options:Null<flight.esm.types.image_codec_contract.Types.ImageDecodeOptions>) -> js.lib.Promise<flight.esm.types.image_codec_contract.Types.DecodedImage>);

typedef ImageEncodeOptions = { ?quality:Null<Float> };

typedef ImageEncoder = ((image:flight.esm.types.image_codec_contract.Types.DecodedImage, ?options:Null<flight.esm.types.image_codec_contract.Types.ImageEncodeOptions>) -> js.lib.Promise<js.lib.Uint8Array>);

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
