package flight._cpp;

private extern class BitmapFontCharRecord_Ffi {
	@:native("flight_get_bitmap_font_char_record_height") static function get_height(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_bitmap_font_char_record_height") static function set_height(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_bitmap_font_char_record_id") static function get_id(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_bitmap_font_char_record_id") static function set_id(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_bitmap_font_char_record_page") static function get_page(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_bitmap_font_char_record_page") static function set_page(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_bitmap_font_char_record_width") static function get_width(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_bitmap_font_char_record_width") static function set_width(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_bitmap_font_char_record_x") static function get_x(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_bitmap_font_char_record_x") static function set_x(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_bitmap_font_char_record_xadvance") static function get_xadvance(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_bitmap_font_char_record_xadvance") static function set_xadvance(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_bitmap_font_char_record_xoffset") static function get_xoffset(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_bitmap_font_char_record_xoffset") static function set_xoffset(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_bitmap_font_char_record_y") static function get_y(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_bitmap_font_char_record_y") static function set_y(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_bitmap_font_char_record_yoffset") static function get_yoffset(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_bitmap_font_char_record_yoffset") static function set_yoffset(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract BitmapFontCharRecord(cpp.Star<cpp.Void>) {
	public var height(get, set):Int;

	inline function get_height():Int return BitmapFontCharRecord_Ffi.get_height(this);

	inline function set_height(value:Int):Int { BitmapFontCharRecord_Ffi.set_height(this, value); return value; }
	public var id(get, set):Int;

	inline function get_id():Int return BitmapFontCharRecord_Ffi.get_id(this);

	inline function set_id(value:Int):Int { BitmapFontCharRecord_Ffi.set_id(this, value); return value; }
	public var page(get, set):Int;

	inline function get_page():Int return BitmapFontCharRecord_Ffi.get_page(this);

	inline function set_page(value:Int):Int { BitmapFontCharRecord_Ffi.set_page(this, value); return value; }
	public var width(get, set):Int;

	inline function get_width():Int return BitmapFontCharRecord_Ffi.get_width(this);

	inline function set_width(value:Int):Int { BitmapFontCharRecord_Ffi.set_width(this, value); return value; }
	public var x(get, set):Int;

	inline function get_x():Int return BitmapFontCharRecord_Ffi.get_x(this);

	inline function set_x(value:Int):Int { BitmapFontCharRecord_Ffi.set_x(this, value); return value; }
	public var xadvance(get, set):Single;

	inline function get_xadvance():Single return BitmapFontCharRecord_Ffi.get_xadvance(this);

	inline function set_xadvance(value:Single):Single { BitmapFontCharRecord_Ffi.set_xadvance(this, value); return value; }
	public var xoffset(get, set):Int;

	inline function get_xoffset():Int return BitmapFontCharRecord_Ffi.get_xoffset(this);

	inline function set_xoffset(value:Int):Int { BitmapFontCharRecord_Ffi.set_xoffset(this, value); return value; }
	public var y(get, set):Int;

	inline function get_y():Int return BitmapFontCharRecord_Ffi.get_y(this);

	inline function set_y(value:Int):Int { BitmapFontCharRecord_Ffi.set_y(this, value); return value; }
	public var yoffset(get, set):Int;

	inline function get_yoffset():Int return BitmapFontCharRecord_Ffi.get_yoffset(this);

	inline function set_yoffset(value:Int):Int { BitmapFontCharRecord_Ffi.set_yoffset(this, value); return value; }
}
