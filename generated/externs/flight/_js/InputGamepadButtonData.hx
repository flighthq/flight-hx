package flight._js;

@:jsRequire("flight")
private extern class InputGamepadButtonData_Ffi {
	@:native("flight_get_input_gamepad_button_data_button") static function get_button(ptr:Dynamic):Int;
	@:native("flight_set_input_gamepad_button_data_button") static function set_button(ptr:Dynamic, value:Int):Int;
	@:native("flight_get_input_gamepad_button_data_gamepad") static function get_gamepad(ptr:Dynamic):Int;
	@:native("flight_set_input_gamepad_button_data_gamepad") static function set_gamepad(ptr:Dynamic, value:Int):Int;
	@:native("flight_get_input_gamepad_button_data_time_stamp") static function get_timeStamp(ptr:Dynamic):Float;
	@:native("flight_set_input_gamepad_button_data_time_stamp") static function set_timeStamp(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_input_gamepad_button_data_value") static function get_value(ptr:Dynamic):Float;
	@:native("flight_set_input_gamepad_button_data_value") static function set_value(ptr:Dynamic, value:Float):Float;
}

abstract InputGamepadButtonData(Dynamic) {
	public var button(get, set):Int;

	inline function get_button():Int return InputGamepadButtonData_Ffi.get_button(this);

	inline function set_button(value:Int):Int return InputGamepadButtonData_Ffi.set_button(this, value);
	public var gamepad(get, set):Int;

	inline function get_gamepad():Int return InputGamepadButtonData_Ffi.get_gamepad(this);

	inline function set_gamepad(value:Int):Int return InputGamepadButtonData_Ffi.set_gamepad(this, value);
	public var timeStamp(get, set):Float;

	inline function get_timeStamp():Float return InputGamepadButtonData_Ffi.get_timeStamp(this);

	inline function set_timeStamp(value:Float):Float return InputGamepadButtonData_Ffi.set_timeStamp(this, value);
	public var value(get, set):Float;

	inline function get_value():Float return InputGamepadButtonData_Ffi.get_value(this);

	inline function set_value(value:Float):Float return InputGamepadButtonData_Ffi.set_value(this, value);
}
