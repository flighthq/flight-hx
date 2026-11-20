package flight._cpp;

private extern class OrthographicProjection_Ffi {
	@:native("flight_get_orthographic_projection_half_height") static function get_halfHeight(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_orthographic_projection_half_height") static function set_halfHeight(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_orthographic_projection_half_width") static function get_halfWidth(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_orthographic_projection_half_width") static function set_halfWidth(ptr:cpp.Star<cpp.Void>, value:Float):Float;
}

abstract OrthographicProjection(cpp.Star<cpp.Void>) {
	public var halfHeight(get, set):Float;

	inline function get_halfHeight():Float return OrthographicProjection_Ffi.get_halfHeight(this);

	inline function set_halfHeight(value:Float):Float { OrthographicProjection_Ffi.set_halfHeight(this, value); return value; }
	public var halfWidth(get, set):Float;

	inline function get_halfWidth():Float return OrthographicProjection_Ffi.get_halfWidth(this);

	inline function set_halfWidth(value:Float):Float { OrthographicProjection_Ffi.set_halfWidth(this, value); return value; }
}
