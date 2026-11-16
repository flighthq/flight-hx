package flight._cpp;

private extern class InputKeyRepeatOptions_Ffi {
	@:native("flight_get_input_key_repeat_options_delay") static function get_delay(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_input_key_repeat_options_delay") static function set_delay(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_input_key_repeat_options_interval") static function get_interval(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_input_key_repeat_options_interval") static function set_interval(ptr:cpp.Star<cpp.Void>, value:Float):Float;
}

abstract InputKeyRepeatOptions(cpp.Star<cpp.Void>) {
	public var delay(get, set):Float;

	inline function get_delay():Float return InputKeyRepeatOptions_Ffi.get_delay(this);

	inline function set_delay(value:Float):Float { InputKeyRepeatOptions_Ffi.set_delay(this, value); return value; }
	public var interval(get, set):Float;

	inline function get_interval():Float return InputKeyRepeatOptions_Ffi.get_interval(this);

	inline function set_interval(value:Float):Float { InputKeyRepeatOptions_Ffi.set_interval(this, value); return value; }
}
