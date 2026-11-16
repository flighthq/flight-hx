package flight._hl;

private extern class ColladaDecodedAnimationChannel_Ffi {
	@:hlNative("flight", "flight_field_get_collada_decoded_animation_channel_target")
	static function get_target(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_collada_decoded_animation_channel_target")
	static function set_target(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
}

abstract ColladaDecodedAnimationChannel(hl.Bytes) {
	public var target(get, set):String;
	inline function get_target():String {
		final bytes = ColladaDecodedAnimationChannel_Ffi.get_target(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_target(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		ColladaDecodedAnimationChannel_Ffi.set_target(this, bytes.getData().bytes, bytes.length);
		return value;
	}

}
