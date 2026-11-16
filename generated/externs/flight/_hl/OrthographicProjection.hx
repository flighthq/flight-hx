package flight._hl;

private extern class OrthographicProjection_Ffi {
	@:hlNative("flight", "flight_get_orthographic_projection_half_height")
	static function get_halfHeight(ptr:hl.Bytes):Single;
	@:hlNative("flight", "flight_set_orthographic_projection_half_height")
	static function set_halfHeight(ptr:hl.Bytes, value:Single):Single;
	@:hlNative("flight", "flight_get_orthographic_projection_half_width")
	static function get_halfWidth(ptr:hl.Bytes):Single;
	@:hlNative("flight", "flight_set_orthographic_projection_half_width")
	static function set_halfWidth(ptr:hl.Bytes, value:Single):Single;
}

abstract OrthographicProjection(hl.Bytes) {
	public var halfHeight(get, set):Single;

	inline function get_halfHeight():Single return OrthographicProjection_Ffi.get_halfHeight(this);
	inline function set_halfHeight(value:Single):Single { OrthographicProjection_Ffi.set_halfHeight(this, value); return value; }
	public var halfWidth(get, set):Single;

	inline function get_halfWidth():Single return OrthographicProjection_Ffi.get_halfWidth(this);
	inline function set_halfWidth(value:Single):Single { OrthographicProjection_Ffi.set_halfWidth(this, value); return value; }
}
