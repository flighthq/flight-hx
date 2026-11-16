package flight._cpp;

private extern class ColladaDecodedAnimationChannel_Ffi {
	@:native("flight_field_get_collada_decoded_animation_channel_target")
	static function get_target(ptr:cpp.Star<cpp.Void>):flight._cpp.NativeByteBuffer;
	@:native("flight_field_set_collada_decoded_animation_channel_target")
	static function set_target(ptr:cpp.Star<cpp.Void>, data:cpp.Star<cpp.Void>, length:Int):Void;
}

abstract ColladaDecodedAnimationChannel(cpp.Star<cpp.Void>) {
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
		ColladaDecodedAnimationChannel_Ffi.set_target(this, cast cpp.Pointer.ofArray(bytes.getData()).raw, bytes.length);
		return value;
	}

}
