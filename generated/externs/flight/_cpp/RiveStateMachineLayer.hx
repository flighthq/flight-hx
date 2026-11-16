package flight._cpp;

private extern class RiveStateMachineLayer_Ffi {
	@:native("flight_field_get_rive_state_machine_layer_name")
	static function get_name(ptr:cpp.Star<cpp.Void>):flight._cpp.NativeByteBuffer;
	@:native("flight_field_set_rive_state_machine_layer_name")
	static function set_name(ptr:cpp.Star<cpp.Void>, data:cpp.Star<cpp.Void>, length:Int):Void;
}

abstract RiveStateMachineLayer(cpp.Star<cpp.Void>) {
	public var name(get, set):String;
	inline function get_name():String {
		final bytes = RiveStateMachineLayer_Ffi.get_name(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_name(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		RiveStateMachineLayer_Ffi.set_name(this, cast cpp.Pointer.ofArray(bytes.getData()).raw, bytes.length);
		return value;
	}

}
