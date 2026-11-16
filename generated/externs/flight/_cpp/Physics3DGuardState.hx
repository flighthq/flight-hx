package flight._cpp;

private extern class Physics3DGuardState_Ffi {
	@:native("flight_get_physics3_dguard_state_enabled") static function get_enabled(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_physics3_dguard_state_enabled") static function set_enabled(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
}

abstract Physics3DGuardState(cpp.Star<cpp.Void>) {
	public var enabled(get, set):Bool;

	inline function get_enabled():Bool return Physics3DGuardState_Ffi.get_enabled(this);

	inline function set_enabled(value:Bool):Bool { Physics3DGuardState_Ffi.set_enabled(this, value); return value; }
}
