package flight._hl;

private extern class BitmapFontPageRecord_Ffi {
	@:hlNative("flight", "flight_field_get_bitmap_font_page_record_file")
	static function get_file(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_bitmap_font_page_record_file")
	static function set_file(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
}

abstract BitmapFontPageRecord(hl.Bytes) {
	public var file(get, set):String;
	inline function get_file():String {
		final bytes = BitmapFontPageRecord_Ffi.get_file(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_file(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		BitmapFontPageRecord_Ffi.set_file(this, bytes.getData().bytes, bytes.length);
		return value;
	}

	public var id(get, set):Int;

	inline function get_id():Int return this.getI32(24);

	inline function set_id(value:Int):Int { this.setI32(24, value); return value; }
}
