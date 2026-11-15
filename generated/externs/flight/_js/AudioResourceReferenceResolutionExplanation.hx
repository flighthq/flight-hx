package flight._js;

@:jsRequire("flight")
private extern class AudioResourceReferenceResolutionExplanation_Ffi {
	@:native("flight_get_audio_resource_reference_resolution_explanation_retryable") static function get_retryable(ptr:Dynamic):Bool;
	@:native("flight_set_audio_resource_reference_resolution_explanation_retryable") static function set_retryable(ptr:Dynamic, value:Bool):Bool;
}

abstract AudioResourceReferenceResolutionExplanation(Dynamic) {
	public var retryable(get, set):Bool;

	inline function get_retryable():Bool return AudioResourceReferenceResolutionExplanation_Ffi.get_retryable(this);

	inline function set_retryable(value:Bool):Bool return AudioResourceReferenceResolutionExplanation_Ffi.set_retryable(this, value);
}
