package flight._cpp;

private extern class BitmapFontKerningData_Ffi {
	@:native("flight_get_bitmap_font_kerning_data_amount") static function get_amount(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_bitmap_font_kerning_data_amount") static function set_amount(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_bitmap_font_kerning_data_left") static function get_left(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_bitmap_font_kerning_data_left") static function set_left(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_bitmap_font_kerning_data_right") static function get_right(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_bitmap_font_kerning_data_right") static function set_right(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract BitmapFontKerningData(cpp.Star<cpp.Void>) {
	public var amount(get, set):Single;

	inline function get_amount():Single return BitmapFontKerningData_Ffi.get_amount(this);

	inline function set_amount(value:Single):Single { BitmapFontKerningData_Ffi.set_amount(this, value); return value; }
	public var left(get, set):Int;

	inline function get_left():Int return BitmapFontKerningData_Ffi.get_left(this);

	inline function set_left(value:Int):Int { BitmapFontKerningData_Ffi.set_left(this, value); return value; }
	public var right(get, set):Int;

	inline function get_right():Int return BitmapFontKerningData_Ffi.get_right(this);

	inline function set_right(value:Int):Int { BitmapFontKerningData_Ffi.set_right(this, value); return value; }
}
