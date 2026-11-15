package flight._js._fn;

@:jsRequire("flight")
extern class Audio {
	@:native("flight_create_audio_buffer")
	public static function createAudioBuffer(length:Int, numberOfChannels:Int, sampleRate:Float):Dynamic;
	@:native("flight_copy_to_audio_buffer_channel")
	public static function copyToAudioBufferChannel(buffer:Dynamic, source:Dynamic, sourceLen:Int, channel:Int):Void;
	@:native("flight_has_audio_decode_slot")
	public static function hasAudioDecodeSlot(audioDecode:flight._js.HostAudioDecodeCapabilities, mimeType:String):Bool;
	@:native("flight_can_play_audio_type")
	public static function canPlayAudioType(hostAudioCodec:flight._js.HostAudioCodecCapability, mimeType:String):Bool;
	@:native("flight_get_audio_mime_type_essence")
	public static function getAudioMimeTypeEssence(mimeType:String):String;
	@:native("flight_get_audio_mime_type_parameter")
	public static function getAudioMimeTypeParameter(mimeType:String, name:String):String;
	@:native("flight_infer_audio_mime_type")
	public static function inferAudioMimeType(url:String):String;
	@:native("flight_create_audio_resource")
	public static function createAudioResource(buffer:Dynamic):Dynamic;
	@:native("flight_clone_audio_resource")
	public static function cloneAudioResource(resource:Dynamic):Dynamic;
	@:native("flight_dispose_audio_resource")
	public static function disposeAudioResource(resource:Dynamic):Void;
	@:native("flight_get_audio_resource_byte_size")
	public static function getAudioResourceByteSize(resource:Dynamic):Int;
	@:native("flight_get_audio_resource_channel_count")
	public static function getAudioResourceChannelCount(resource:Dynamic):Int;
	@:native("flight_get_audio_resource_duration")
	public static function getAudioResourceDuration(resource:Dynamic):Float;
	@:native("flight_get_audio_resource_sample_rate")
	public static function getAudioResourceSampleRate(resource:Dynamic):Float;
	@:native("flight_has_audio_resource_buffer")
	public static function hasAudioResourceBuffer(resource:Dynamic):Bool;
	@:native("flight_is_audio_resource_empty")
	public static function isAudioResourceEmpty(resource:Dynamic):Bool;
	@:native("flight_select_audio_resource_url")
	public static function selectAudioResourceUrl(hostAudioCodec:flight._js.HostAudioCodecCapability, sources:Dynamic, sourcesLen:Int, decoders:flight._js.AudioDecoderRegistry):String;
	@:native("flight_create_audio_resource_failure")
	public static function createAudioResourceFailure(cause:flight._js.Unknown):Dynamic;
	@:native("flight_create_external_audio_resource_reference")
	public static function createExternalAudioResourceReference(uri:String):Dynamic;
	@:native("flight_explain_audio_resource_reference_resolution")
	public static function explainAudioResourceReferenceResolution(reference:flight._js.AudioResourceReference):flight._js.AudioResourceReferenceResolutionExplanation;
	@:native("flight_find_audio_resource_reference_by_name")
	public static function findAudioResourceReferenceByName(references:Dynamic, referencesLen:Int, name:String):Dynamic;
	@:native("flight_reset_failed_audio_resource_reference")
	public static function resetFailedAudioResourceReference(reference:flight._js.AudioResourceReference):Bool;
	@:native("flight_get_audio_channel_state_string")
	public static function getAudioChannelStateString(value:Int):String;
	@:native("flight_get_audio_resource_failure_kind_string")
	public static function getAudioResourceFailureKindString(value:Int):String;
	@:native("flight_get_audio_resource_reference_kind_string")
	public static function getAudioResourceReferenceKindString(value:Int):String;
	@:native("flight_parse_audio_channel_state")
	public static function parseAudioChannelState(value:String):Int;
	@:native("flight_parse_audio_resource_failure_kind")
	public static function parseAudioResourceFailureKind(value:String):Int;
	@:native("flight_parse_audio_resource_reference_kind")
	public static function parseAudioResourceReferenceKind(value:String):Int;
	@:native("flight_free_audio_resource_reference_resolution_explanation")
	public static function freeAudioResourceReferenceResolutionExplanation(ptr:flight._js.AudioResourceReferenceResolutionExplanation):Void;
	@:native("flight_free_audio_resource_reference")
	public static function freeAudioResourceReference(ptr:flight._js.AudioResourceReference):Void;
	@:native("flight_free_string")
	public static function freeString(ptr:Dynamic):Void;
}
