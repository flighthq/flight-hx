package flight._cpp;

private extern class BitmapFontKerningPair_Ffi {
	@:native("flight_get_bitmap_font_kerning_pair_left") static function get_left(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_bitmap_font_kerning_pair_left") static function set_left(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_bitmap_font_kerning_pair_right") static function get_right(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_bitmap_font_kerning_pair_right") static function set_right(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract BitmapFontKerningPair(cpp.Star<cpp.Void>) {
	public var left(get, set):Int;

	inline function get_left():Int return BitmapFontKerningPair_Ffi.get_left(this);

	inline function set_left(value:Int):Int return BitmapFontKerningPair_Ffi.set_left(this, value);
	public var right(get, set):Int;

	inline function get_right():Int return BitmapFontKerningPair_Ffi.get_right(this);

	inline function set_right(value:Int):Int return BitmapFontKerningPair_Ffi.set_right(this, value);
}
