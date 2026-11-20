package flight._cpp;

private extern class InputGamepadConnectData_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_get_input_gamepad_connect_data_gamepad") static function get_gamepad(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_input_gamepad_connect_data_gamepad") static function set_gamepad(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_field_get_input_gamepad_connect_data_id") static function get_id(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_input_gamepad_connect_data_id") static function set_id(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
}

abstract InputGamepadConnectData(cpp.Star<cpp.Void>) {
	public var gamepad(get, set):Int;

	inline function get_gamepad():Int return InputGamepadConnectData_Ffi.get_gamepad(this);

	inline function set_gamepad(value:Int):Int { InputGamepadConnectData_Ffi.set_gamepad(this, value); return value; }
	public var id(get, set):String;
	inline function get_id():String { var raw = InputGamepadConnectData_Ffi.get_id(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); InputGamepadConnectData_Ffi.freeString(raw); return value; }
	inline function set_id(value:String):String { var raw:cpp.ConstCharStar = cast value; InputGamepadConnectData_Ffi.set_id(this, raw); return value; }
}
