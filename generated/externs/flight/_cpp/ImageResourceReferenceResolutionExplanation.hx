package flight._cpp;

private extern class ImageResourceReferenceResolutionExplanation_Ffi {
	@:native("flight_get_image_resource_reference_resolution_explanation_retryable") static function get_retryable(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_image_resource_reference_resolution_explanation_retryable") static function set_retryable(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
}

abstract ImageResourceReferenceResolutionExplanation(cpp.Star<cpp.Void>) {
	public var retryable(get, set):Bool;

	inline function get_retryable():Bool return ImageResourceReferenceResolutionExplanation_Ffi.get_retryable(this);

	inline function set_retryable(value:Bool):Bool { ImageResourceReferenceResolutionExplanation_Ffi.set_retryable(this, value); return value; }
}
