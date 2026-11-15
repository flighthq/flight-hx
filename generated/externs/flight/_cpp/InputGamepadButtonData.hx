package flight._cpp;

private extern class InputGamepadButtonData_Ffi {
	@:native("flight_get_input_gamepad_button_data_button") static function get_button(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_input_gamepad_button_data_button") static function set_button(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_input_gamepad_button_data_gamepad") static function get_gamepad(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_input_gamepad_button_data_gamepad") static function set_gamepad(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_input_gamepad_button_data_time_stamp") static function get_timeStamp(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_input_gamepad_button_data_time_stamp") static function set_timeStamp(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_input_gamepad_button_data_value") static function get_value(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_input_gamepad_button_data_value") static function set_value(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract InputGamepadButtonData(cpp.Star<cpp.Void>) {
	public var button(get, set):Int;

	inline function get_button():Int return InputGamepadButtonData_Ffi.get_button(this);

	inline function set_button(value:Int):Int return InputGamepadButtonData_Ffi.set_button(this, value);
	public var gamepad(get, set):Int;

	inline function get_gamepad():Int return InputGamepadButtonData_Ffi.get_gamepad(this);

	inline function set_gamepad(value:Int):Int return InputGamepadButtonData_Ffi.set_gamepad(this, value);
	public var timeStamp(get, set):Float;

	inline function get_timeStamp():Float return InputGamepadButtonData_Ffi.get_timeStamp(this);

	inline function set_timeStamp(value:Float):Float return InputGamepadButtonData_Ffi.set_timeStamp(this, value);
	public var value(get, set):Single;

	inline function get_value():Single return InputGamepadButtonData_Ffi.get_value(this);

	inline function set_value(value:Single):Single return InputGamepadButtonData_Ffi.set_value(this, value);
}
