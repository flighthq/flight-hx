package flight._cpp;

private extern class InputGamepadAxisData_Ffi {
	@:native("flight_get_input_gamepad_axis_data_axis") static function get_axis(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_input_gamepad_axis_data_axis") static function set_axis(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_input_gamepad_axis_data_gamepad") static function get_gamepad(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_input_gamepad_axis_data_gamepad") static function set_gamepad(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_input_gamepad_axis_data_time_stamp") static function get_timeStamp(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_input_gamepad_axis_data_time_stamp") static function set_timeStamp(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_input_gamepad_axis_data_value") static function get_value(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_input_gamepad_axis_data_value") static function set_value(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract InputGamepadAxisData(cpp.Star<cpp.Void>) {
	public var axis(get, set):Int;

	inline function get_axis():Int return InputGamepadAxisData_Ffi.get_axis(this);

	inline function set_axis(value:Int):Int return InputGamepadAxisData_Ffi.set_axis(this, value);
	public var gamepad(get, set):Int;

	inline function get_gamepad():Int return InputGamepadAxisData_Ffi.get_gamepad(this);

	inline function set_gamepad(value:Int):Int return InputGamepadAxisData_Ffi.set_gamepad(this, value);
	public var timeStamp(get, set):Float;

	inline function get_timeStamp():Float return InputGamepadAxisData_Ffi.get_timeStamp(this);

	inline function set_timeStamp(value:Float):Float return InputGamepadAxisData_Ffi.set_timeStamp(this, value);
	public var value(get, set):Single;

	inline function get_value():Single return InputGamepadAxisData_Ffi.get_value(this);

	inline function set_value(value:Single):Single return InputGamepadAxisData_Ffi.set_value(this, value);
}
