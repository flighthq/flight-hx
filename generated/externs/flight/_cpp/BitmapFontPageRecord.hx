package flight._cpp;

private extern class BitmapFontPageRecord_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_field_get_bitmap_font_page_record_file") static function get_file(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_bitmap_font_page_record_file") static function set_file(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_get_bitmap_font_page_record_id") static function get_id(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_bitmap_font_page_record_id") static function set_id(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract BitmapFontPageRecord(cpp.Star<cpp.Void>) {
	public var file(get, set):String;
	inline function get_file():String { var raw = BitmapFontPageRecord_Ffi.get_file(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); BitmapFontPageRecord_Ffi.freeString(raw); return value; }
	inline function set_file(value:String):String { var raw:cpp.ConstCharStar = cast value; BitmapFontPageRecord_Ffi.set_file(this, raw); return value; }
	public var id(get, set):Int;

	inline function get_id():Int return BitmapFontPageRecord_Ffi.get_id(this);

	inline function set_id(value:Int):Int { BitmapFontPageRecord_Ffi.set_id(this, value); return value; }
}
