package flight._cpp;

private extern class BitmapFontKerningRecord_Ffi {
	@:native("flight_get_bitmap_font_kerning_record_amount") static function get_amount(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_bitmap_font_kerning_record_amount") static function set_amount(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_bitmap_font_kerning_record_first") static function get_first(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_bitmap_font_kerning_record_first") static function set_first(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_bitmap_font_kerning_record_second") static function get_second(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_bitmap_font_kerning_record_second") static function set_second(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract BitmapFontKerningRecord(cpp.Star<cpp.Void>) {
	public var amount(get, set):Single;

	inline function get_amount():Single return BitmapFontKerningRecord_Ffi.get_amount(this);

	inline function set_amount(value:Single):Single { BitmapFontKerningRecord_Ffi.set_amount(this, value); return value; }
	public var first(get, set):Int;

	inline function get_first():Int return BitmapFontKerningRecord_Ffi.get_first(this);

	inline function set_first(value:Int):Int { BitmapFontKerningRecord_Ffi.set_first(this, value); return value; }
	public var second(get, set):Int;

	inline function get_second():Int return BitmapFontKerningRecord_Ffi.get_second(this);

	inline function set_second(value:Int):Int { BitmapFontKerningRecord_Ffi.set_second(this, value); return value; }
}
