package flight._cpp;

private extern class Scene3DGuardState_Ffi {
	@:native("flight_get_scene3_dguard_state_enabled") static function get_enabled(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_scene3_dguard_state_enabled") static function set_enabled(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
}

abstract Scene3DGuardState(cpp.Star<cpp.Void>) {
	public var enabled(get, set):Bool;

	inline function get_enabled():Bool return Scene3DGuardState_Ffi.get_enabled(this);

	inline function set_enabled(value:Bool):Bool { Scene3DGuardState_Ffi.set_enabled(this, value); return value; }
}
