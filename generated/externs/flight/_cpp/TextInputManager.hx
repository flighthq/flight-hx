package flight._cpp;

private extern class TextInputManager_Ffi {
	@:native("flight_get_text_input_manager_enabled") static function get_enabled(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_text_input_manager_enabled") static function set_enabled(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
}

abstract TextInputManager(cpp.Star<cpp.Void>) {
	public var enabled(get, set):Bool;

	inline function get_enabled():Bool return TextInputManager_Ffi.get_enabled(this);

	inline function set_enabled(value:Bool):Bool { TextInputManager_Ffi.set_enabled(this, value); return value; }
}
