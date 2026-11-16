package flight._hl;

private extern class FontFaceSourceUrl_Ffi {
	@:hlNative("flight", "flight_field_get_font_face_source_url_value")
	static function get_value(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_font_face_source_url_value")
	static function set_value(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
}

abstract FontFaceSourceUrl(hl.Bytes) {
	public var value(get, set):String;
	inline function get_value():String {
		final bytes = FontFaceSourceUrl_Ffi.get_value(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_value(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		FontFaceSourceUrl_Ffi.set_value(this, bytes.getData().bytes, bytes.length);
		return value;
	}

}
