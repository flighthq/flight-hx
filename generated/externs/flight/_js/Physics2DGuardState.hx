package flight._js;

@:jsRequire("flight")
private extern class Physics2DGuardState_Ffi {
	@:native("flight_get_physics2_dguard_state_enabled") static function get_enabled(ptr:Dynamic):Bool;
	@:native("flight_set_physics2_dguard_state_enabled") static function set_enabled(ptr:Dynamic, value:Bool):Bool;
}

abstract Physics2DGuardState(Dynamic) {
	public var enabled(get, set):Bool;

	inline function get_enabled():Bool return Physics2DGuardState_Ffi.get_enabled(this);

	inline function set_enabled(value:Bool):Bool return Physics2DGuardState_Ffi.set_enabled(this, value);
}
