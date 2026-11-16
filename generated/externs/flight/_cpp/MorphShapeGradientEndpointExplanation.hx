package flight._cpp;

private extern class MorphShapeGradientEndpointExplanation_Ffi {
	@:native("flight_get_morph_shape_gradient_endpoint_explanation_end_stop_count") static function get_endStopCount(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_morph_shape_gradient_endpoint_explanation_end_stop_count") static function set_endStopCount(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_morph_shape_gradient_endpoint_explanation_start_stop_count") static function get_startStopCount(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_morph_shape_gradient_endpoint_explanation_start_stop_count") static function set_startStopCount(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_morph_shape_gradient_endpoint_explanation_supported") static function get_supported(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_morph_shape_gradient_endpoint_explanation_supported") static function set_supported(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
}

abstract MorphShapeGradientEndpointExplanation(cpp.Star<cpp.Void>) {
	public var endStopCount(get, set):Int;

	inline function get_endStopCount():Int return MorphShapeGradientEndpointExplanation_Ffi.get_endStopCount(this);

	inline function set_endStopCount(value:Int):Int { MorphShapeGradientEndpointExplanation_Ffi.set_endStopCount(this, value); return value; }
	public var startStopCount(get, set):Int;

	inline function get_startStopCount():Int return MorphShapeGradientEndpointExplanation_Ffi.get_startStopCount(this);

	inline function set_startStopCount(value:Int):Int { MorphShapeGradientEndpointExplanation_Ffi.set_startStopCount(this, value); return value; }
	public var supported(get, set):Bool;

	inline function get_supported():Bool return MorphShapeGradientEndpointExplanation_Ffi.get_supported(this);

	inline function set_supported(value:Bool):Bool { MorphShapeGradientEndpointExplanation_Ffi.set_supported(this, value); return value; }
}
