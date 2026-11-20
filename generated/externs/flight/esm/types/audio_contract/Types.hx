package flight.esm.types.audio_contract;

#if (js && flight_esm)
typedef AudioBuffer = flight.esm.types.audio.Types.AudioBuffer;

typedef AudioChannelState = flight.esm.types.audio.Types.AudioChannelState;

typedef AudioDecoder = flight.esm.types.audio.Types.AudioDecoder;

typedef AudioDecoderRegistry = flight.esm.types.audio.Types.AudioDecoderRegistry;

typedef AudioPlayOptions = flight.esm.types.audio.Types.AudioPlayOptions;

typedef AudioResource = flight.esm.types.audio.Types.AudioResource;

typedef AudioResourceFailure = flight.esm.types.audio.Types.AudioResourceFailure;

typedef AudioResourceFailureKind = flight.esm.types.audio.Types.AudioResourceFailureKind;

typedef AudioResourceFetch = flight.esm.types.audio.Types.AudioResourceFetch;

typedef AudioResourceReference = flight.esm.types.audio.Types.AudioResourceReference;

typedef AudioResourceReferenceKind = flight.esm.types.audio.Types.AudioResourceReferenceKind;

typedef AudioResourceReferenceResolutionExplanation = flight.esm.types.audio.Types.AudioResourceReferenceResolutionExplanation;

typedef AudioResourceUrl = flight.esm.types.audio.Types.AudioResourceUrl;

typedef EmbeddedAudioResourceReference = flight.esm.types.audio.Types.EmbeddedAudioResourceReference;

typedef ExternalAudioResourceReference = flight.esm.types.audio.Types.ExternalAudioResourceReference;

typedef HostAudioCodecCapability = flight.esm.types.audio.Types.HostAudioCodecCapability;

typedef HostAudioDecodeCapabilities = flight.esm.types.audio.Types.HostAudioDecodeCapabilities;

typedef HostAudioDecodeFormatCapability = flight.esm.types.audio.Types.HostAudioDecodeFormatCapability;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
