package flight._cpp;

private extern class RiveStateMachineState_Ffi {
	@:native("flight_get_rive_state_machine_state_animation_id") static function get_animationId(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_rive_state_machine_state_animation_id") static function set_animationId(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_field_get_rive_state_machine_state_kind")
	static function get_kind(ptr:cpp.Star<cpp.Void>):flight._cpp.NativeByteBuffer;
	@:native("flight_field_set_rive_state_machine_state_kind")
	static function set_kind(ptr:cpp.Star<cpp.Void>, data:cpp.Star<cpp.Void>, length:Int):Void;
}

abstract RiveStateMachineState(cpp.Star<cpp.Void>) {
	public var animationId(get, set):Single;

	inline function get_animationId():Single return RiveStateMachineState_Ffi.get_animationId(this);

	inline function set_animationId(value:Single):Single { RiveStateMachineState_Ffi.set_animationId(this, value); return value; }
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
		RiveStateMachineState_Ffi.set_kind(this, cast cpp.Pointer.ofArray(bytes.getData()).raw, bytes.length);
		return value;
	}

}
