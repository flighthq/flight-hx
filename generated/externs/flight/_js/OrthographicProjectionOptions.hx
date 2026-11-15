package flight._js;

@:jsRequire("flight")
private extern class OrthographicProjectionOptions_Ffi {
	@:native("flight_get_orthographic_projection_options_half_height") static function get_halfHeight(ptr:Dynamic):Float;
	@:native("flight_set_orthographic_projection_options_half_height") static function set_halfHeight(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_orthographic_projection_options_half_width") static function get_halfWidth(ptr:Dynamic):Float;
	@:native("flight_set_orthographic_projection_options_half_width") static function set_halfWidth(ptr:Dynamic, value:Float):Float;
}

abstract OrthographicProjectionOptions(Dynamic) {
	public var halfHeight(get, set):Float;

	inline function get_halfHeight():Float return OrthographicProjectionOptions_Ffi.get_halfHeight(this);

	inline function set_halfHeight(value:Float):Float return OrthographicProjectionOptions_Ffi.set_halfHeight(this, value);
	public var halfWidth(get, set):Float;

	inline function get_halfWidth():Float return OrthographicProjectionOptions_Ffi.get_halfWidth(this);

	inline function set_halfWidth(value:Float):Float return OrthographicProjectionOptions_Ffi.set_halfWidth(this, value);
}
