package flight._cpp;

private extern class GamepadStickOutput_Ffi {
	@:native("flight_get_gamepad_stick_output_x") static function get_x(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_gamepad_stick_output_x") static function set_x(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_gamepad_stick_output_y") static function get_y(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_gamepad_stick_output_y") static function set_y(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract GamepadStickOutput(cpp.Star<cpp.Void>) {
	public var x(get, set):Single;

	inline function get_x():Single return GamepadStickOutput_Ffi.get_x(this);

	inline function set_x(value:Single):Single return GamepadStickOutput_Ffi.set_x(this, value);
	public var y(get, set):Single;

	inline function get_y():Single return GamepadStickOutput_Ffi.get_y(this);

	inline function set_y(value:Single):Single return GamepadStickOutput_Ffi.set_y(this, value);
}
