package flight._js;

@:jsRequire("flight")
private extern class InputKeyRepeatOptions_Ffi {
	@:native("flight_get_input_key_repeat_options_delay") static function get_delay(ptr:Dynamic):Float;
	@:native("flight_set_input_key_repeat_options_delay") static function set_delay(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_input_key_repeat_options_interval") static function get_interval(ptr:Dynamic):Float;
	@:native("flight_set_input_key_repeat_options_interval") static function set_interval(ptr:Dynamic, value:Float):Float;
}

abstract InputKeyRepeatOptions(Dynamic) {
	public var delay(get, set):Float;

	inline function get_delay():Float return InputKeyRepeatOptions_Ffi.get_delay(this);

	inline function set_delay(value:Float):Float return InputKeyRepeatOptions_Ffi.set_delay(this, value);
	public var interval(get, set):Float;

	inline function get_interval():Float return InputKeyRepeatOptions_Ffi.get_interval(this);

	inline function set_interval(value:Float):Float return InputKeyRepeatOptions_Ffi.set_interval(this, value);
}
