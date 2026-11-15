package flight._js;

@:jsRequire("flight")
private extern class OrthographicProjection_Ffi {
	@:native("flight_get_orthographic_projection_half_height") static function get_halfHeight(ptr:Dynamic):Float;
	@:native("flight_set_orthographic_projection_half_height") static function set_halfHeight(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_orthographic_projection_half_width") static function get_halfWidth(ptr:Dynamic):Float;
	@:native("flight_set_orthographic_projection_half_width") static function set_halfWidth(ptr:Dynamic, value:Float):Float;
}

abstract OrthographicProjection(Dynamic) {
	public var halfHeight(get, set):Float;

	inline function get_halfHeight():Float return OrthographicProjection_Ffi.get_halfHeight(this);

	inline function set_halfHeight(value:Float):Float return OrthographicProjection_Ffi.set_halfHeight(this, value);
	public var halfWidth(get, set):Float;

	inline function get_halfWidth():Float return OrthographicProjection_Ffi.get_halfWidth(this);

	inline function set_halfWidth(value:Float):Float return OrthographicProjection_Ffi.set_halfWidth(this, value);
}
