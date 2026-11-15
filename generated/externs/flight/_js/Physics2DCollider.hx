package flight._js;

@:jsRequire("flight")
private extern class Physics2DCollider_Ffi {
	@:native("flight_get_physics2_dcollider_sensor") static function get_sensor(ptr:Dynamic):Bool;
	@:native("flight_set_physics2_dcollider_sensor") static function set_sensor(ptr:Dynamic, value:Bool):Bool;
}

abstract Physics2DCollider(Dynamic) {
	public var sensor(get, set):Bool;

	inline function get_sensor():Bool return Physics2DCollider_Ffi.get_sensor(this);

	inline function set_sensor(value:Bool):Bool return Physics2DCollider_Ffi.set_sensor(this, value);
}
