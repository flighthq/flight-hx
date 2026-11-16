package flight._cpp;

private extern class InputManager_Ffi {
	@:native("flight_get_input_manager_enabled") static function get_enabled(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_input_manager_enabled") static function set_enabled(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
}

abstract InputManager(cpp.Star<cpp.Void>) {
	public var enabled(get, set):Bool;

	inline function get_enabled():Bool return InputManager_Ffi.get_enabled(this);

	inline function set_enabled(value:Bool):Bool { InputManager_Ffi.set_enabled(this, value); return value; }
}
