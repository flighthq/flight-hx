package flight._cpp;

private extern class OrthographicProjection_Ffi {
	@:native("flight_get_orthographic_projection_half_height") static function get_halfHeight(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_orthographic_projection_half_height") static function set_halfHeight(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_orthographic_projection_half_width") static function get_halfWidth(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_orthographic_projection_half_width") static function set_halfWidth(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract OrthographicProjection(cpp.Star<cpp.Void>) {
	public var halfHeight(get, set):Single;

	inline function get_halfHeight():Single return OrthographicProjection_Ffi.get_halfHeight(this);

	inline function set_halfHeight(value:Single):Single return OrthographicProjection_Ffi.set_halfHeight(this, value);
	public var halfWidth(get, set):Single;

	inline function get_halfWidth():Single return OrthographicProjection_Ffi.get_halfWidth(this);

	inline function set_halfWidth(value:Single):Single return OrthographicProjection_Ffi.set_halfWidth(this, value);
}
