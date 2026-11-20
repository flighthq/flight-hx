package flight._cpp;

private extern class Scene2DResourceFailureGuardState_Ffi {
	@:native("flight_get_scene2_dresource_failure_guard_state_enabled") static function get_enabled(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_scene2_dresource_failure_guard_state_enabled") static function set_enabled(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
}

abstract Scene2DResourceFailureGuardState(cpp.Star<cpp.Void>) {
	public var enabled(get, set):Bool;

	inline function get_enabled():Bool return Scene2DResourceFailureGuardState_Ffi.get_enabled(this);

	inline function set_enabled(value:Bool):Bool { Scene2DResourceFailureGuardState_Ffi.set_enabled(this, value); return value; }
}
