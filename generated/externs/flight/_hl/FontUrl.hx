package flight._hl;

private extern class FontUrl_Ffi {
	@:hlNative("flight", "flight_field_get_font_url_url")
	static function get_url(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_font_url_url")
	static function set_url(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
}

abstract FontUrl(hl.Bytes) {
	public var url(get, set):String;
	inline function get_url():String {
		final bytes = FontUrl_Ffi.get_url(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_url(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		FontUrl_Ffi.set_url(this, bytes.getData().bytes, bytes.length);
		return value;
	}

}
