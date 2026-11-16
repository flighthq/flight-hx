package flight._cpp;

private extern class BitmapFontPageRecord_Ffi {
	@:native("flight_field_get_bitmap_font_page_record_file")
	static function get_file(ptr:cpp.Star<cpp.Void>):flight._cpp.NativeByteBuffer;
	@:native("flight_field_set_bitmap_font_page_record_file")
	static function set_file(ptr:cpp.Star<cpp.Void>, data:cpp.Star<cpp.Void>, length:Int):Void;
	@:native("flight_get_bitmap_font_page_record_id") static function get_id(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_bitmap_font_page_record_id") static function set_id(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract BitmapFontPageRecord(cpp.Star<cpp.Void>) {
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
		BitmapFontPageRecord_Ffi.set_file(this, cast cpp.Pointer.ofArray(bytes.getData()).raw, bytes.length);
		return value;
	}

	public var id(get, set):Int;

	inline function get_id():Int return BitmapFontPageRecord_Ffi.get_id(this);

	inline function set_id(value:Int):Int { BitmapFontPageRecord_Ffi.set_id(this, value); return value; }
}
