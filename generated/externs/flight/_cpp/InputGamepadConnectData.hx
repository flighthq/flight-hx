package flight._cpp;

private extern class InputGamepadConnectData_Ffi {
	@:native("flight_get_input_gamepad_connect_data_gamepad") static function get_gamepad(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_input_gamepad_connect_data_gamepad") static function set_gamepad(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract InputGamepadConnectData(cpp.Star<cpp.Void>) {
	public var gamepad(get, set):Int;

	inline function get_gamepad():Int return InputGamepadConnectData_Ffi.get_gamepad(this);

	inline function set_gamepad(value:Int):Int return InputGamepadConnectData_Ffi.set_gamepad(this, value);
}
