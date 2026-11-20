package flight._js._fn;

@:jsRequire("@flighthq/audio")
extern class Audio {
	@:native("createAudioBuffer")
	public static function createAudioBuffer(length:Int, numberOfChannels:Int, sampleRate:Float):Dynamic;
	@:native("copyToAudioBufferChannel")
	public static function copyToAudioBufferChannel(buffer:Dynamic, source:Dynamic, channel:Int):Void;
	@:native("hasAudioDecodeSlot")
	public static function hasAudioDecodeSlot(audioDecode:flight._js.HostAudioDecodeCapabilities, mimeType:String):Bool;
	@:native("canPlayAudioType")
	public static function canPlayAudioType(hostAudioCodec:flight._js.HostAudioCodecCapability, mimeType:String):Bool;
	@:native("getAudioMimeTypeEssence")
	public static function getAudioMimeTypeEssence(mimeType:String):String;
	@:native("getAudioMimeTypeParameter")
	public static function getAudioMimeTypeParameter(mimeType:String, name:String):Null<String>;
	@:native("inferAudioMimeType")
	public static function inferAudioMimeType(url:String):Null<String>;
	@:native("createAudioResource")
	public static function createAudioResource(buffer:Null<Dynamic>):Dynamic;
	@:native("cloneAudioResource")
	public static function cloneAudioResource(resource:Dynamic):Dynamic;
	@:native("disposeAudioResource")
	public static function disposeAudioResource(resource:Dynamic):Void;
	@:native("getAudioResourceByteSize")
	public static function getAudioResourceByteSize(resource:Dynamic):Int;
	@:native("getAudioResourceChannelCount")
	public static function getAudioResourceChannelCount(resource:Dynamic):Int;
	@:native("getAudioResourceDuration")
	public static function getAudioResourceDuration(resource:Dynamic):Float;
	@:native("getAudioResourceSampleRate")
	public static function getAudioResourceSampleRate(resource:Dynamic):Float;
	@:native("hasAudioResourceBuffer")
	public static function hasAudioResourceBuffer(resource:Dynamic):Bool;
	@:native("isAudioResourceEmpty")
	public static function isAudioResourceEmpty(resource:Dynamic):Bool;
	@:native("selectAudioResourceUrl")
	public static function selectAudioResourceUrl(hostAudioCodec:flight._js.HostAudioCodecCapability, sources:Dynamic, decoders:Null<flight._js.AudioDecoderRegistry>):Null<String>;
	@:native("createAudioResourceFailure")
	public static function createAudioResourceFailure(cause:flight._js.Unknown):Dynamic;
	@:native("createExternalAudioResourceReference")
	public static function createExternalAudioResourceReference(uri:String):Dynamic;
	@:native("explainAudioResourceReferenceResolution")
	public static function explainAudioResourceReferenceResolution(reference:flight._js.AudioResourceReference):flight._js.AudioResourceReferenceResolutionExplanation;
	@:native("findAudioResourceReferenceByName")
	public static function findAudioResourceReferenceByName(references:Dynamic, name:String):Null<flight._js.AudioResourceReference>;
	@:native("resetFailedAudioResourceReference")
	public static function resetFailedAudioResourceReference(reference:flight._js.AudioResourceReference):Bool;
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeAudioBufferRef(ptr:flight._js.AudioBuffer):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeAudioResourceRef(ptr:flight._js.AudioResource):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeAudioResourceFailureRef(ptr:flight._js.AudioResourceFailure):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeExternalAudioResourceReferenceRef(ptr:flight._js.ExternalAudioResourceReference):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeAudioResourceReferenceResolutionExplanation(ptr:flight._js.AudioResourceReferenceResolutionExplanation):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeAudioResourceReference(ptr:flight._js.AudioResourceReference):Void {}
}
