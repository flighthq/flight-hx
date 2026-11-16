package flight._cpp;

private extern class InputGamepadConnectData_Ffi {
	@:native("flight_get_input_gamepad_connect_data_gamepad") static function get_gamepad(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_input_gamepad_connect_data_gamepad") static function set_gamepad(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_field_get_input_gamepad_connect_data_id")
	static function get_id(ptr:cpp.Star<cpp.Void>):flight._cpp.NativeByteBuffer;
	@:native("flight_field_set_input_gamepad_connect_data_id")
	static function set_id(ptr:cpp.Star<cpp.Void>, data:cpp.Star<cpp.Void>, length:Int):Void;
}

abstract InputGamepadConnectData(cpp.Star<cpp.Void>) {
	public var gamepad(get, set):Int;

	inline function get_gamepad():Int return InputGamepadConnectData_Ffi.get_gamepad(this);

	inline function set_gamepad(value:Int):Int { InputGamepadConnectData_Ffi.set_gamepad(this, value); return value; }
	public var id(get, set):String;
	inline function get_id():String {
		final bytes = InputGamepadConnectData_Ffi.get_id(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_id(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		InputGamepadConnectData_Ffi.set_id(this, cast cpp.Pointer.ofArray(bytes.getData()).raw, bytes.length);
		return value;
	}

}
