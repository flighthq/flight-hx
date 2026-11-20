package flight.esm.types.sdk_image;

#if (js && flight_esm)
typedef EmbeddedImageResourceReference = flight.esm.types.image.Types.EmbeddedImageResourceReference;

typedef ExternalImageResourceReference = flight.esm.types.image.Types.ExternalImageResourceReference;

typedef ImageResourceFailure = flight.esm.types.image.Types.ImageResourceFailure;

typedef ImageResourceFailureKind = flight.esm.types.image.Types.ImageResourceFailureKind;

typedef ImageResourceFetch = flight.esm.types.image.Types.ImageResourceFetch;

typedef ImageResourceReference = flight.esm.types.image.Types.ImageResourceReference;

typedef ImageResourceReferenceKind = flight.esm.types.image.Types.ImageResourceReferenceKind;

typedef ImageResourceReferenceResolutionExplanation = flight.esm.types.image.Types.ImageResourceReferenceResolutionExplanation;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
