package flight._js;

@:jsRequire("flight")
private extern class ShapeBoundsExplanation_Ffi {
	@:native("flight_get_shape_bounds_explanation_complete") static function get_complete(ptr:Dynamic):Bool;
	@:native("flight_set_shape_bounds_explanation_complete") static function set_complete(ptr:Dynamic, value:Bool):Bool;
}

abstract ShapeBoundsExplanation(Dynamic) {
	public var complete(get, set):Bool;

	inline function get_complete():Bool return ShapeBoundsExplanation_Ffi.get_complete(this);

	inline function set_complete(value:Bool):Bool return ShapeBoundsExplanation_Ffi.set_complete(this, value);
}
