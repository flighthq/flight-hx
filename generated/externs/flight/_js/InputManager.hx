package flight._js;

@:jsRequire("flight")
private extern class InputManager_Ffi {
	@:native("flight_get_input_manager_enabled") static function get_enabled(ptr:Dynamic):Bool;
	@:native("flight_set_input_manager_enabled") static function set_enabled(ptr:Dynamic, value:Bool):Bool;
}

abstract InputManager(Dynamic) {
	public var enabled(get, set):Bool;

	inline function get_enabled():Bool return InputManager_Ffi.get_enabled(this);

	inline function set_enabled(value:Bool):Bool return InputManager_Ffi.set_enabled(this, value);
}
