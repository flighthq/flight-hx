package flight._hl;

private extern class InputGamepadConnectData_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_input_gamepad_connect_data_id")
	static function get_id(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_input_gamepad_connect_data_id")
	static function set_id(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract InputGamepadConnectData(hl.Bytes) {
	public var gamepad(get, set):Int;

	inline function get_gamepad():Int return this.getI32(0);

	inline function set_gamepad(value:Int):Int { this.setI32(0, value); return value; }
	public var id(get, set):String;
	inline function get_id():String { var raw = InputGamepadConnectData_Ffi.get_id(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); InputGamepadConnectData_Ffi.freeString(raw); return value; }
	inline function set_id(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } InputGamepadConnectData_Ffi.set_id(this, raw); return value; }
}
