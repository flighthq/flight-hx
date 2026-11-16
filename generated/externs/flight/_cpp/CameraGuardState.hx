package flight._cpp;

private extern class CameraGuardState_Ffi {
	@:native("flight_get_camera_guard_state_enabled") static function get_enabled(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_camera_guard_state_enabled") static function set_enabled(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
}

abstract CameraGuardState(cpp.Star<cpp.Void>) {
	public var enabled(get, set):Bool;

	inline function get_enabled():Bool return CameraGuardState_Ffi.get_enabled(this);

	inline function set_enabled(value:Bool):Bool { CameraGuardState_Ffi.set_enabled(this, value); return value; }
}
