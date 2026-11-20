package flight.esm.types.image;

#if (js && flight_esm)
typedef EmbeddedImageResourceReference = { kind:String, alphaType:flight.esm.types.texture_contract.Types.AlphaType, ?bitmapComposition:Null<flight.esm.types.image_contract.Types.ImageBitmapComposition>, bytes:js.lib.Uint8Array, failure:Null<flight.esm.types.image.Types.ImageResourceFailure>, mimeType:Null<String>, state:flight.esm.types.resource.Types.ResourceResolutionState, ?textures:Null<Array<flight.esm.types.texture_contract.Types.Texture>> };

typedef ExternalImageResourceReference = { kind:String, uri:String, basePath:Null<String>, failure:Null<flight.esm.types.image.Types.ImageResourceFailure>, mimeType:Null<String>, state:flight.esm.types.resource.Types.ResourceResolutionState, ?textures:Null<Array<flight.esm.types.texture_contract.Types.Texture>> };

typedef ImageResourceFailure = { kind:flight.esm.types.image.Types.ImageResourceFailureKind, message:String, name:Null<String> };

typedef ImageResourceFailureKind = String;

typedef ImageResourceFetch = ((ref:flight.esm.types.image.Types.ExternalImageResourceReference, signal:js.html.AbortSignal) -> js.lib.Promise<Null<flight.esm.types.image_contract.Types.ImageResource>>);

typedef ImageResourceReference = Dynamic;

typedef ImageResourceReferenceKind = String;

typedef ImageResourceReferenceResolutionExplanation = { failure:Null<flight.esm.types.image.Types.ImageResourceFailure>, kind:flight.esm.types.image.Types.ImageResourceReferenceKind, retryable:Bool, state:flight.esm.types.resource.Types.ResourceResolutionState };

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
