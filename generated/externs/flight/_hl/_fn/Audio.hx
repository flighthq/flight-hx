package flight._hl._fn;

extern class Audio {
	@:hlNative("flight", "flight_create_audio_buffer")
	public static function createAudioBuffer(length:Int, numberOfChannels:Int, sampleRate:Single):hl.Bytes;
	@:hlNative("flight", "flight_copy_to_audio_buffer_channel")
	public static function copyToAudioBufferChannel(buffer:hl.Bytes, source:hl.Bytes, sourceLen:Int, channel:Int):Void;
	@:hlNative("flight", "flight_has_audio_decode_slot")
	public static function hasAudioDecodeSlot(audioDecode:flight._hl.HostAudioDecodeCapabilities, mimeType:hl.Bytes):Bool;
	@:hlNative("flight", "flight_can_play_audio_type")
	public static function canPlayAudioType(hostAudioCodec:flight._hl.HostAudioCodecCapability, mimeType:hl.Bytes):Bool;
	@:hlNative("flight", "flight_get_audio_mime_type_essence")
	public static function getAudioMimeTypeEssence(mimeType:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_get_audio_mime_type_parameter")
	public static function getAudioMimeTypeParameter(mimeType:hl.Bytes, name:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_infer_audio_mime_type")
	public static function inferAudioMimeType(url:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_create_audio_resource")
	public static function createAudioResource(buffer:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_clone_audio_resource")
	public static function cloneAudioResource(resource:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_dispose_audio_resource")
	public static function disposeAudioResource(resource:hl.Bytes):Void;
	@:hlNative("flight", "flight_get_audio_resource_byte_size")
	public static function getAudioResourceByteSize(resource:hl.Bytes):Int;
	@:hlNative("flight", "flight_get_audio_resource_channel_count")
	public static function getAudioResourceChannelCount(resource:hl.Bytes):Int;
	@:hlNative("flight", "flight_get_audio_resource_duration")
	public static function getAudioResourceDuration(resource:hl.Bytes):Float;
	@:hlNative("flight", "flight_get_audio_resource_sample_rate")
	public static function getAudioResourceSampleRate(resource:hl.Bytes):Single;
	@:hlNative("flight", "flight_has_audio_resource_buffer")
	public static function hasAudioResourceBuffer(resource:hl.Bytes):Bool;
	@:hlNative("flight", "flight_is_audio_resource_empty")
	public static function isAudioResourceEmpty(resource:hl.Bytes):Bool;
	@:hlNative("flight", "flight_select_audio_resource_url")
	public static function selectAudioResourceUrl(hostAudioCodec:flight._hl.HostAudioCodecCapability, sources:hl.Bytes, sourcesLen:Int, decoders:flight._hl.AudioDecoderRegistry):hl.Bytes;
	@:hlNative("flight", "flight_create_audio_resource_failure")
	public static function createAudioResourceFailure(cause:flight._hl.Unknown):hl.Bytes;
	@:hlNative("flight", "flight_create_external_audio_resource_reference")
	public static function createExternalAudioResourceReference(uri:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_explain_audio_resource_reference_resolution")
	public static function explainAudioResourceReferenceResolution(reference:flight._hl.AudioResourceReference):flight._hl.AudioResourceReferenceResolutionExplanation;
	@:hlNative("flight", "flight_find_audio_resource_reference_by_name")
	public static function findAudioResourceReferenceByName(references:hl.Bytes, referencesLen:Int, name:hl.Bytes):flight._hl.AudioResourceReference;
	@:hlNative("flight", "flight_reset_failed_audio_resource_reference")
	public static function resetFailedAudioResourceReference(reference:flight._hl.AudioResourceReference):Bool;
	@:hlNative("flight", "flight_free_audio_resource_reference_resolution_explanation")
	public static function freeAudioResourceReferenceResolutionExplanation(ptr:flight._hl.AudioResourceReferenceResolutionExplanation):Void;
	@:hlNative("flight", "flight_free_audio_resource_reference")
	public static function freeAudioResourceReference(ptr:flight._hl.AudioResourceReference):Void;
	@:hlNative("flight", "flight_free_string")
	public static function freeString(ptr:hl.Bytes):Void;
}
