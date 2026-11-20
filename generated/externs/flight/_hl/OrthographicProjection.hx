package flight._hl;

private extern class OrthographicProjection_Ffi {
	@:hlNative("flight", "flight_get_orthographic_projection_half_height")
	static function get_halfHeight(ptr:hl.Bytes):Float;
	@:hlNative("flight", "flight_set_orthographic_projection_half_height")
	static function set_halfHeight(ptr:hl.Bytes, value:Float):Float;
	@:hlNative("flight", "flight_get_orthographic_projection_half_width")
	static function get_halfWidth(ptr:hl.Bytes):Float;
	@:hlNative("flight", "flight_set_orthographic_projection_half_width")
	static function set_halfWidth(ptr:hl.Bytes, value:Float):Float;
}

abstract OrthographicProjection(hl.Bytes) {
	public var halfHeight(get, set):Float;

	inline function get_halfHeight():Float return OrthographicProjection_Ffi.get_halfHeight(this);

	inline function set_halfHeight(value:Float):Float { OrthographicProjection_Ffi.set_halfHeight(this, value); return value; }
	public var halfWidth(get, set):Float;

	inline function get_halfWidth():Float return OrthographicProjection_Ffi.get_halfWidth(this);

	inline function set_halfWidth(value:Float):Float { OrthographicProjection_Ffi.set_halfWidth(this, value); return value; }
}
