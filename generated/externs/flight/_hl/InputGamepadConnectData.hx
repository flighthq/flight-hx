package flight._hl;

private extern class InputGamepadConnectData_Ffi {
	@:hlNative("flight", "flight_field_get_input_gamepad_connect_data_id")
	static function get_id(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_input_gamepad_connect_data_id")
	static function set_id(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
}

abstract InputGamepadConnectData(hl.Bytes) {
	public var gamepad(get, set):Int;

	inline function get_gamepad():Int return this.getI32(0);

	inline function set_gamepad(value:Int):Int { this.setI32(0, value); return value; }
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
		InputGamepadConnectData_Ffi.set_id(this, bytes.getData().bytes, bytes.length);
		return value;
	}

}
