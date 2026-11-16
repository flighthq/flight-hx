package flight._cpp;

private extern class Physics3DCollider_Ffi {
	@:native("flight_get_physics3_dcollider_sensor") static function get_sensor(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_physics3_dcollider_sensor") static function set_sensor(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
}

abstract Physics3DCollider(cpp.Star<cpp.Void>) {
	public var sensor(get, set):Bool;

	inline function get_sensor():Bool return Physics3DCollider_Ffi.get_sensor(this);

	inline function set_sensor(value:Bool):Bool { Physics3DCollider_Ffi.set_sensor(this, value); return value; }
}
