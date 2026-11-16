package flight._hl;

private extern class RiveStateMachineState_Ffi {
	@:hlNative("flight", "flight_field_get_rive_state_machine_state_kind")
	static function get_kind(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_rive_state_machine_state_kind")
	static function set_kind(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
}

abstract RiveStateMachineState(hl.Bytes) {
	public var animationId(get, set):Single;

	inline function get_animationId():Single return this.getF32(0);

	inline function set_animationId(value:Single):Single { this.setF32(0, value); return value; }
	public var kind(get, set):String;
	inline function get_kind():String {
		final bytes = RiveStateMachineState_Ffi.get_kind(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_kind(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		RiveStateMachineState_Ffi.set_kind(this, bytes.getData().bytes, bytes.length);
		return value;
	}

}
