package flight.esm;

#if (js && flight_esm)
@:jsRequire("@flighthq/audio")
extern class Audio {
  public static final AudioResourceFailureKind:Dynamic;
  public static final AudioResourceReferenceKind:Dynamic;
  public static function canPlayAudioType(hostAudioCodec:flight.esm.types.audio.Types.HostAudioCodecCapability, mimeType:String):Bool;
  public static function cloneAudioResource(resource:flight.esm.types.audio.Types.AudioResource):flight.esm.types.audio.Types.AudioResource;
  public static function copyToAudioBufferChannel(buffer:flight.esm.types.audio.Types.AudioBuffer, source:js.lib.Float32Array, channel:Float):Void;
  public static function createAudioBuffer(length:Float, numberOfChannels:Float, sampleRate:Float):flight.esm.types.audio.Types.AudioBuffer;
  public static function createAudioResource(?buffer:Null<flight.esm.types.audio.Types.AudioBuffer>):flight.esm.types.audio.Types.AudioResource;
  public static function createAudioResourceFailure(cause:Dynamic):flight.esm.types.audio.Types.AudioResourceFailure;
  public static function createAudioResourceFromSamples(channels:Array<js.lib.Float32Array>, sampleRate:Float):flight.esm.types.audio.Types.AudioResource;
  public static function createEmbeddedAudioResourceReference(bytes:js.lib.Uint8Array, ?mimeType:Null<String>, ?name:Null<String>):flight.esm.types.audio.Types.EmbeddedAudioResourceReference;
  public static function createExternalAudioResourceReference(uri:String, ?basePath:Null<String>, ?mimeType:Null<String>, ?name:Null<String>):flight.esm.types.audio.Types.ExternalAudioResourceReference;
  public static function detectAudioMimeType(data:Dynamic):Null<String>;
  public static function disposeAudioResource(resource:flight.esm.types.audio.Types.AudioResource):Void;
  public static function explainAudioResourceReferenceResolution(ref:flight.esm.types.audio.Types.AudioResourceReference):flight.esm.types.audio.Types.AudioResourceReferenceResolutionExplanation;
  public static function findAudioResourceReferenceByName(references:Array<flight.esm.types.audio.Types.AudioResourceReference>, name:String):Dynamic;
  public static function getAudioDecodeSlot(audioDecode:flight.esm.types.audio.Types.HostAudioDecodeCapabilities, mimeType:String):Null<flight.esm.types.audio.Types.HostAudioDecodeFormatCapability>;
  public static function getAudioMimeTypeEssence(mimeType:String):String;
  public static function getAudioMimeTypeParameter(mimeType:String, name:String):Null<String>;
  public static function getAudioResourceByteSize(resource:flight.esm.types.audio.Types.AudioResource):Float;
  public static function getAudioResourceChannelCount(resource:flight.esm.types.audio.Types.AudioResource):Float;
  public static function getAudioResourceChannelData(resource:flight.esm.types.audio.Types.AudioResource, channel:Float):Null<js.lib.Float32Array>;
  public static function getAudioResourceDuration(resource:flight.esm.types.audio.Types.AudioResource):Float;
  public static function getAudioResourceSampleRate(resource:flight.esm.types.audio.Types.AudioResource):Float;
  public static function hasAudioDecodeSlot(audioDecode:flight.esm.types.audio.Types.HostAudioDecodeCapabilities, mimeType:String):Bool;
  public static function hasAudioResourceBuffer(resource:flight.esm.types.audio.Types.AudioResource):Bool;
  public static function inferAudioMimeType(url:String):Null<String>;
  public static function isAudioResourceEmpty(resource:flight.esm.types.audio.Types.AudioResource):Bool;
  public static function loadAudioResourceFromBase64(audioDecode:flight.esm.types.audio.Types.HostAudioDecodeCapabilities, base64:String, mimeType:String, ?signal:Null<js.html.AbortSignal>, ?decoders:Null<flight.esm.types.audio.Types.AudioDecoderRegistry>):js.lib.Promise<flight.esm.types.audio.Types.AudioResource>;
  public static function loadAudioResourceFromBlob(audioDecode:flight.esm.types.audio.Types.HostAudioDecodeCapabilities, blob:js.html.Blob, ?signal:Null<js.html.AbortSignal>, ?decoders:Null<flight.esm.types.audio.Types.AudioDecoderRegistry>):js.lib.Promise<flight.esm.types.audio.Types.AudioResource>;
  public static function loadAudioResourceFromBytes(audioDecode:flight.esm.types.audio.Types.HostAudioDecodeCapabilities, bytes:js.lib.Uint8Array, ?mimeType:Null<String>, ?signal:Null<js.html.AbortSignal>, ?decoders:Null<flight.esm.types.audio.Types.AudioDecoderRegistry>):js.lib.Promise<flight.esm.types.audio.Types.AudioResource>;
  public static function loadAudioResourceFromUrl(hostNet:flight.esm.types.net.Types.HostNetCapability, audioDecode:flight.esm.types.audio.Types.HostAudioDecodeCapabilities, url:String, ?signal:Null<js.html.AbortSignal>, ?decoders:Null<flight.esm.types.audio.Types.AudioDecoderRegistry>):js.lib.Promise<flight.esm.types.audio.Types.AudioResource>;
  public static function loadAudioResourceFromUrls(hostNet:flight.esm.types.net.Types.HostNetCapability, hostAudioCodec:flight.esm.types.audio.Types.HostAudioCodecCapability, audioDecode:flight.esm.types.audio.Types.HostAudioDecodeCapabilities, sources:Array<flight.esm.types.audio.Types.AudioResourceUrl>, ?signal:Null<js.html.AbortSignal>, ?decoders:Null<flight.esm.types.audio.Types.AudioDecoderRegistry>):js.lib.Promise<flight.esm.types.audio.Types.AudioResource>;
  public static function resetFailedAudioResourceReference(ref:flight.esm.types.audio.Types.AudioResourceReference):Bool;
  public static function resolveAudioResourceReference(ref:flight.esm.types.audio.Types.AudioResourceReference, audioDecode:flight.esm.types.audio.Types.HostAudioDecodeCapabilities, fetch:flight.esm.types.audio.Types.AudioResourceFetch, signal:js.html.AbortSignal, ?decoders:Null<flight.esm.types.audio.Types.AudioDecoderRegistry>):js.lib.Promise<Null<flight.esm.types.audio.Types.AudioResource>>;
  public static function selectAudioResourceUrl(hostAudioCodec:flight.esm.types.audio.Types.HostAudioCodecCapability, sources:Array<flight.esm.types.audio.Types.AudioResourceUrl>, ?decoders:Null<flight.esm.types.audio.Types.AudioDecoderRegistry>):Null<String>;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
