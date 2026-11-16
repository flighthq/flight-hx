package flight._hl;

private extern class FontFace_Ffi {
	@:hlNative("flight", "flight_field_get_font_face_family")
	static function get_family(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_font_face_family")
	static function set_family(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
}

abstract FontFace(hl.Bytes) {
	public var family(get, set):String;
	inline function get_family():String {
		final bytes = FontFace_Ffi.get_family(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_family(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		FontFace_Ffi.set_family(this, bytes.getData().bytes, bytes.length);
		return value;
	}

}
