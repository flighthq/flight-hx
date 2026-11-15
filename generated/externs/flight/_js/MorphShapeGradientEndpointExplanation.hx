package flight._js;

@:jsRequire("flight")
private extern class MorphShapeGradientEndpointExplanation_Ffi {
	@:native("flight_get_morph_shape_gradient_endpoint_explanation_end_stop_count") static function get_endStopCount(ptr:Dynamic):Int;
	@:native("flight_set_morph_shape_gradient_endpoint_explanation_end_stop_count") static function set_endStopCount(ptr:Dynamic, value:Int):Int;
	@:native("flight_get_morph_shape_gradient_endpoint_explanation_start_stop_count") static function get_startStopCount(ptr:Dynamic):Int;
	@:native("flight_set_morph_shape_gradient_endpoint_explanation_start_stop_count") static function set_startStopCount(ptr:Dynamic, value:Int):Int;
	@:native("flight_get_morph_shape_gradient_endpoint_explanation_supported") static function get_supported(ptr:Dynamic):Bool;
	@:native("flight_set_morph_shape_gradient_endpoint_explanation_supported") static function set_supported(ptr:Dynamic, value:Bool):Bool;
}

abstract MorphShapeGradientEndpointExplanation(Dynamic) {
	public var endStopCount(get, set):Int;

	inline function get_endStopCount():Int return MorphShapeGradientEndpointExplanation_Ffi.get_endStopCount(this);

	inline function set_endStopCount(value:Int):Int return MorphShapeGradientEndpointExplanation_Ffi.set_endStopCount(this, value);
	public var startStopCount(get, set):Int;

	inline function get_startStopCount():Int return MorphShapeGradientEndpointExplanation_Ffi.get_startStopCount(this);

	inline function set_startStopCount(value:Int):Int return MorphShapeGradientEndpointExplanation_Ffi.set_startStopCount(this, value);
	public var supported(get, set):Bool;

	inline function get_supported():Bool return MorphShapeGradientEndpointExplanation_Ffi.get_supported(this);

	inline function set_supported(value:Bool):Bool return MorphShapeGradientEndpointExplanation_Ffi.set_supported(this, value);
}
