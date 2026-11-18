package flight._cpp._fn;

extern class Audio {
	@:native("flight_create_audio_buffer")
	public static function createAudioBuffer(length:Int, numberOfChannels:Int, sampleRate:Single):cpp.Star<cpp.Void>;
	@:native("flight_copy_to_audio_buffer_channel")
	public static function copyToAudioBufferChannel(buffer:cpp.Star<cpp.Void>, source:cpp.Star<cpp.Void>, sourceLen:Int, channel:Int):Void;
	@:native("flight_has_audio_decode_slot")
	public static function hasAudioDecodeSlot(audioDecode:flight._cpp.HostAudioDecodeCapabilities, mimeType:cpp.ConstCharStar):Bool;
	@:native("flight_can_play_audio_type")
	public static function canPlayAudioType(hostAudioCodec:flight._cpp.HostAudioCodecCapability, mimeType:cpp.ConstCharStar):Bool;
	@:native("flight_get_audio_mime_type_essence")
	public static function getAudioMimeTypeEssence(mimeType:cpp.ConstCharStar):cpp.ConstCharStar;
	@:native("flight_get_audio_mime_type_parameter")
	public static function getAudioMimeTypeParameter(mimeType:cpp.ConstCharStar, name:cpp.ConstCharStar):cpp.ConstCharStar;
	@:native("flight_infer_audio_mime_type")
	public static function inferAudioMimeType(url:cpp.ConstCharStar):cpp.ConstCharStar;
	@:native("flight_create_audio_resource")
	public static function createAudioResource(buffer:cpp.Star<cpp.Void>):cpp.Star<cpp.Void>;
	@:native("flight_clone_audio_resource")
	public static function cloneAudioResource(resource:cpp.Star<cpp.Void>):cpp.Star<cpp.Void>;
	@:native("flight_dispose_audio_resource")
	public static function disposeAudioResource(resource:cpp.Star<cpp.Void>):Void;
	@:native("flight_get_audio_resource_byte_size")
	public static function getAudioResourceByteSize(resource:cpp.Star<cpp.Void>):Int;
	@:native("flight_get_audio_resource_channel_count")
	public static function getAudioResourceChannelCount(resource:cpp.Star<cpp.Void>):Int;
	@:native("flight_get_audio_resource_duration")
	public static function getAudioResourceDuration(resource:cpp.Star<cpp.Void>):Float;
	@:native("flight_get_audio_resource_sample_rate")
	public static function getAudioResourceSampleRate(resource:cpp.Star<cpp.Void>):Single;
	@:native("flight_has_audio_resource_buffer")
	public static function hasAudioResourceBuffer(resource:cpp.Star<cpp.Void>):Bool;
	@:native("flight_is_audio_resource_empty")
	public static function isAudioResourceEmpty(resource:cpp.Star<cpp.Void>):Bool;
	@:native("flight_select_audio_resource_url")
	public static function selectAudioResourceUrl(hostAudioCodec:flight._cpp.HostAudioCodecCapability, sources:cpp.Star<cpp.Void>, sourcesLen:Int, decoders:flight._cpp.AudioDecoderRegistry):cpp.ConstCharStar;
	@:native("flight_create_audio_resource_failure")
	public static function createAudioResourceFailure(cause:flight._cpp.Unknown):cpp.Star<cpp.Void>;
	@:native("flight_create_external_audio_resource_reference")
	public static function createExternalAudioResourceReference(uri:cpp.ConstCharStar):cpp.Star<cpp.Void>;
	@:native("flight_explain_audio_resource_reference_resolution")
	public static function explainAudioResourceReferenceResolution(reference:flight._cpp.AudioResourceReference):flight._cpp.AudioResourceReferenceResolutionExplanation;
	@:native("flight_find_audio_resource_reference_by_name")
	public static function findAudioResourceReferenceByName(references:cpp.Star<cpp.Void>, referencesLen:Int, name:cpp.ConstCharStar):flight._cpp.AudioResourceReference;
	@:native("flight_reset_failed_audio_resource_reference")
	public static function resetFailedAudioResourceReference(reference:flight._cpp.AudioResourceReference):Bool;
	@:native("flight_free_audio_resource_reference_resolution_explanation")
	public static function freeAudioResourceReferenceResolutionExplanation(ptr:flight._cpp.AudioResourceReferenceResolutionExplanation):Void;
	@:native("flight_free_audio_resource_reference")
	public static function freeAudioResourceReference(ptr:flight._cpp.AudioResourceReference):Void;
	@:native("flight_free_string")
	public static function freeString(ptr:cpp.Star<cpp.Void>):Void;
}
