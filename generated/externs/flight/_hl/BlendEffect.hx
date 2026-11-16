package flight._hl;

private extern class BlendEffect_Ffi {
	@:hlNative("flight", "flight_field_get_blend_effect_mode")
	static function get_mode(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_blend_effect_mode")
	static function set_mode(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
}

abstract BlendEffect(hl.Bytes) {
	public var mode(get, set):String;
	inline function get_mode():String {
		final bytes = BlendEffect_Ffi.get_mode(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_mode(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		BlendEffect_Ffi.set_mode(this, bytes.getData().bytes, bytes.length);
		return value;
	}

}
