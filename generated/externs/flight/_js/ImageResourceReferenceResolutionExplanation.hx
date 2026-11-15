package flight._js;

@:jsRequire("flight")
private extern class ImageResourceReferenceResolutionExplanation_Ffi {
	@:native("flight_get_image_resource_reference_resolution_explanation_retryable") static function get_retryable(ptr:Dynamic):Bool;
	@:native("flight_set_image_resource_reference_resolution_explanation_retryable") static function set_retryable(ptr:Dynamic, value:Bool):Bool;
}

abstract ImageResourceReferenceResolutionExplanation(Dynamic) {
	public var retryable(get, set):Bool;

	inline function get_retryable():Bool return ImageResourceReferenceResolutionExplanation_Ffi.get_retryable(this);

	inline function set_retryable(value:Bool):Bool return ImageResourceReferenceResolutionExplanation_Ffi.set_retryable(this, value);
}
