package flight.esm.types.image_contract;

#if (js && flight_esm)
typedef CompressedImageData = { container:flight.esm.types.texture_formats.Types.TextureContainer, payload:js.lib.Uint8Array };

typedef CompressedImageResource = { compressed:flight.esm.types.image_contract.Types.CompressedImageData, kind:String, alphaType:flight.esm.types.texture_contract.Types.AlphaType, gamut:String, height:Float, version:Float, width:Float };

typedef EmbeddedImageResourceReference = flight.esm.types.image.Types.EmbeddedImageResourceReference;

typedef ExternalImageResourceReference = flight.esm.types.image.Types.ExternalImageResourceReference;

typedef HostImageCapability = { ?createImageFromBitmap:Null<((bitmap:flight.esm.types.bitmap.Types.Bitmap) -> flight.esm.types.image_contract.Types.ImageResource)>, ?createImageFromSurface:Null<((surface:flight.esm.types.surface.Types.Surface) -> flight.esm.types.image_contract.Types.ImageResource)>, loadImageFromUrl:((url:String, ?crossOrigin:Null<String>, ?signal:Null<js.html.AbortSignal>) -> js.lib.Promise<flight.esm.types.image_contract.Types.ImageResource>) };

typedef HostImageDimensionResolver = ((source:Dynamic, out:flight.esm.types.image_contract.Types.HostImageDimensions) -> Bool);

typedef HostImageDimensions = { height:Float, width:Float };

typedef ImageBitmapComposer = ((decoded:Null<flight.esm.types.image_codec_contract.Types.DecodedImage>, payload:js.lib.Uint8Array) -> Null<flight.esm.types.bitmap.Types.Bitmap>);

typedef ImageBitmapComposition = { kind:String, payload:js.lib.Uint8Array };

typedef ImageBitmapCompositionResolver = ((imageDecode:flight.esm.types.image_codec_contract.Types.HostImageDecodeCapabilities, ref:flight.esm.types.image.Types.EmbeddedImageResourceReference, signal:js.html.AbortSignal) -> js.lib.Promise<Null<flight.esm.types.bitmap.Types.Bitmap>>);

typedef ImageOperation = String;

typedef ImageResource = { kind:String, source:Dynamic, alphaType:flight.esm.types.texture_contract.Types.AlphaType, gamut:String, height:Float, version:Float, width:Float };

typedef ImageResourceFailure = flight.esm.types.image.Types.ImageResourceFailure;

typedef ImageResourceFailureKind = flight.esm.types.image.Types.ImageResourceFailureKind;

typedef ImageResourceFetch = flight.esm.types.image.Types.ImageResourceFetch;

typedef ImageResourceReference = flight.esm.types.image.Types.ImageResourceReference;

typedef ImageResourceReferenceKind = flight.esm.types.image.Types.ImageResourceReferenceKind;

typedef ImageResourceReferenceResolutionExplanation = flight.esm.types.image.Types.ImageResourceReferenceResolutionExplanation;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
