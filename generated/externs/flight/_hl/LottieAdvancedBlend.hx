package flight._hl;

private extern class LottieAdvancedBlend_Ffi {
	@:hlNative("flight", "flight_field_get_lottie_advanced_blend_mode")
	static function get_mode(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_lottie_advanced_blend_mode")
	static function set_mode(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
}

abstract LottieAdvancedBlend(hl.Bytes) {
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
		LottieAdvancedBlend_Ffi.set_mode(this, bytes.getData().bytes, bytes.length);
		return value;
	}

}
