package flight._js;

@:jsRequire("flight")
private extern class InputGamepadAxisData_Ffi {
	@:native("flight_get_input_gamepad_axis_data_axis") static function get_axis(ptr:Dynamic):Int;
	@:native("flight_set_input_gamepad_axis_data_axis") static function set_axis(ptr:Dynamic, value:Int):Int;
	@:native("flight_get_input_gamepad_axis_data_gamepad") static function get_gamepad(ptr:Dynamic):Int;
	@:native("flight_set_input_gamepad_axis_data_gamepad") static function set_gamepad(ptr:Dynamic, value:Int):Int;
	@:native("flight_get_input_gamepad_axis_data_time_stamp") static function get_timeStamp(ptr:Dynamic):Float;
	@:native("flight_set_input_gamepad_axis_data_time_stamp") static function set_timeStamp(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_input_gamepad_axis_data_value") static function get_value(ptr:Dynamic):Float;
	@:native("flight_set_input_gamepad_axis_data_value") static function set_value(ptr:Dynamic, value:Float):Float;
}

abstract InputGamepadAxisData(Dynamic) {
	public var axis(get, set):Int;

	inline function get_axis():Int return InputGamepadAxisData_Ffi.get_axis(this);

	inline function set_axis(value:Int):Int return InputGamepadAxisData_Ffi.set_axis(this, value);
	public var gamepad(get, set):Int;

	inline function get_gamepad():Int return InputGamepadAxisData_Ffi.get_gamepad(this);

	inline function set_gamepad(value:Int):Int return InputGamepadAxisData_Ffi.set_gamepad(this, value);
	public var timeStamp(get, set):Float;

	inline function get_timeStamp():Float return InputGamepadAxisData_Ffi.get_timeStamp(this);

	inline function set_timeStamp(value:Float):Float return InputGamepadAxisData_Ffi.set_timeStamp(this, value);
	public var value(get, set):Float;

	inline function get_value():Float return InputGamepadAxisData_Ffi.get_value(this);

	inline function set_value(value:Float):Float return InputGamepadAxisData_Ffi.set_value(this, value);
}
