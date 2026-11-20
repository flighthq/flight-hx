package flight.esm.types.audio;

#if (js && flight_esm)
typedef AudioBuffer = { channels:Array<js.lib.Float32Array>, length:Float, sampleRate:Float };

typedef AudioChannelState = String;

typedef AudioDecoder = ((bytes:js.lib.Uint8Array, mimeType:String, signal:js.html.AbortSignal) -> js.lib.Promise<Null<flight.esm.types.audio.Types.AudioResource>>);

typedef AudioDecoderRegistry = { forEach:((callbackfn:Dynamic, ?thisArg:Dynamic) -> Void), get:((key:String) -> Null<flight.esm.types.audio.Types.AudioDecoder>), has:((key:String) -> Bool), size:Float, entries:(() -> Dynamic), keys:(() -> Dynamic), values:(() -> Dynamic) };

typedef AudioPlayOptions = { ?currentTime:Null<Float>, ?gain:Null<Float>, ?loops:Null<Float>, ?playbackRate:Null<Float> };

typedef AudioResource = { buffer:Null<flight.esm.types.audio.Types.AudioBuffer> };

typedef AudioResourceFailure = { kind:flight.esm.types.audio.Types.AudioResourceFailureKind, message:String, name:Null<String> };

typedef AudioResourceFailureKind = String;

typedef AudioResourceFetch = ((ref:flight.esm.types.audio.Types.ExternalAudioResourceReference, signal:js.html.AbortSignal) -> js.lib.Promise<Null<flight.esm.types.audio.Types.AudioResource>>);

typedef AudioResourceReference = Dynamic;

typedef AudioResourceReferenceKind = String;

typedef AudioResourceReferenceResolutionExplanation = { failure:Null<flight.esm.types.audio.Types.AudioResourceFailure>, kind:flight.esm.types.audio.Types.AudioResourceReferenceKind, retryable:Bool, state:flight.esm.types.resource.Types.ResourceResolutionState };

typedef AudioResourceUrl = { url:String, ?type:Null<String> };

typedef EmbeddedAudioResourceReference = { kind:String, bytes:js.lib.Uint8Array, failure:Null<flight.esm.types.audio.Types.AudioResourceFailure>, mimeType:Null<String>, name:Null<String>, resource:flight.esm.types.audio.Types.AudioResource, state:flight.esm.types.resource.Types.ResourceResolutionState };

typedef ExternalAudioResourceReference = { kind:String, uri:String, basePath:Null<String>, failure:Null<flight.esm.types.audio.Types.AudioResourceFailure>, mimeType:Null<String>, name:Null<String>, resource:flight.esm.types.audio.Types.AudioResource, state:flight.esm.types.resource.Types.ResourceResolutionState };

typedef HostAudioCodecCapability = { canPlayType:((mimeType:String) -> Bool) };

typedef HostAudioDecodeCapabilities = { ?aac:Null<flight.esm.types.audio.Types.HostAudioDecodeFormatCapability>, ?flac:Null<flight.esm.types.audio.Types.HostAudioDecodeFormatCapability>, ?mp3:Null<flight.esm.types.audio.Types.HostAudioDecodeFormatCapability>, ?mp4:Null<flight.esm.types.audio.Types.HostAudioDecodeFormatCapability>, ?ogg:Null<flight.esm.types.audio.Types.HostAudioDecodeFormatCapability>, ?wav:Null<flight.esm.types.audio.Types.HostAudioDecodeFormatCapability>, ?webm:Null<flight.esm.types.audio.Types.HostAudioDecodeFormatCapability> };

typedef HostAudioDecodeFormatCapability = { decode:((bytes:js.lib.Uint8Array, signal:js.html.AbortSignal) -> js.lib.Promise<Null<flight.esm.types.audio.Types.AudioBuffer>>) };

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
