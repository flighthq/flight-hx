package flight._cpp;

private extern class BitmapFontRecord_Ffi {
	@:native("flight_get_bitmap_font_record_base") static function get_base(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_bitmap_font_record_base") static function set_base(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_bitmap_font_record_line_height") static function get_lineHeight(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_bitmap_font_record_line_height") static function set_lineHeight(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract BitmapFontRecord(cpp.Star<cpp.Void>) {
	public var base(get, set):Single;

	inline function get_base():Single return BitmapFontRecord_Ffi.get_base(this);

	inline function set_base(value:Single):Single { BitmapFontRecord_Ffi.set_base(this, value); return value; }
	public var lineHeight(get, set):Single;

	inline function get_lineHeight():Single return BitmapFontRecord_Ffi.get_lineHeight(this);

	inline function set_lineHeight(value:Single):Single { BitmapFontRecord_Ffi.set_lineHeight(this, value); return value; }
}
