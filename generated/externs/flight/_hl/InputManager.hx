package flight._hl;

private extern class InputManager_Ffi {
	@:hlNative("flight", "flight_get_input_manager_enabled")
	static function get_enabled(ptr:hl.Bytes):Bool;
	@:hlNative("flight", "flight_set_input_manager_enabled")
	static function set_enabled(ptr:hl.Bytes, value:Bool):Bool;
}

abstract InputManager(hl.Bytes) {
	public var enabled(get, set):Bool;

	inline function get_enabled():Bool return InputManager_Ffi.get_enabled(this);

	inline function set_enabled(value:Bool):Bool { InputManager_Ffi.set_enabled(this, value); return value; }
}
