package flight._cpp;

private extern class LottieAdvancedBlend_Ffi {
	@:native("flight_field_get_lottie_advanced_blend_mode")
	static function get_mode(ptr:cpp.Star<cpp.Void>):flight._cpp.NativeByteBuffer;
	@:native("flight_field_set_lottie_advanced_blend_mode")
	static function set_mode(ptr:cpp.Star<cpp.Void>, data:cpp.Star<cpp.Void>, length:Int):Void;
}

abstract LottieAdvancedBlend(cpp.Star<cpp.Void>) {
	public var mode(get, set):String;
	inline function get_mode():String {
		final bytes = LottieAdvancedBlend_Ffi.get_mode(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_mode(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		LottieAdvancedBlend_Ffi.set_mode(this, cast cpp.Pointer.ofArray(bytes.getData()).raw, bytes.length);
		return value;
	}

}
