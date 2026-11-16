package flight._hl;

private extern class RiveStateMachineInput_Ffi {
	@:hlNative("flight", "flight_field_get_rive_state_machine_input_kind")
	static function get_kind(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_rive_state_machine_input_kind")
	static function set_kind(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
	@:hlNative("flight", "flight_field_get_rive_state_machine_input_name")
	static function get_name(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_rive_state_machine_input_name")
	static function set_name(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
}

abstract RiveStateMachineInput(hl.Bytes) {
	public var kind(get, set):String;
	inline function get_kind():String {
		final bytes = RiveStateMachineInput_Ffi.get_kind(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_kind(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		RiveStateMachineInput_Ffi.set_kind(this, bytes.getData().bytes, bytes.length);
		return value;
	}

	public var name(get, set):String;
	inline function get_name():String {
		final bytes = RiveStateMachineInput_Ffi.get_name(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_name(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		RiveStateMachineInput_Ffi.set_name(this, bytes.getData().bytes, bytes.length);
		return value;
	}

}
