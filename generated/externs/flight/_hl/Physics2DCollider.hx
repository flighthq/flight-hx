package flight._hl;

private extern class Physics2DCollider_Ffi {
	@:hlNative("flight", "flight_get_physics2_dcollider_sensor")
	static function get_sensor(ptr:hl.Bytes):Bool;
	@:hlNative("flight", "flight_set_physics2_dcollider_sensor")
	static function set_sensor(ptr:hl.Bytes, value:Bool):Bool;
}

abstract Physics2DCollider(hl.Bytes) {
	public var sensor(get, set):Bool;

	inline function get_sensor():Bool return Physics2DCollider_Ffi.get_sensor(this);
	inline function set_sensor(value:Bool):Bool { Physics2DCollider_Ffi.set_sensor(this, value); return value; }
}
