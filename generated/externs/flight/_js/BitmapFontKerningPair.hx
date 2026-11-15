package flight._js;

@:jsRequire("flight")
private extern class BitmapFontKerningPair_Ffi {
	@:native("flight_get_bitmap_font_kerning_pair_left") static function get_left(ptr:Dynamic):Int;
	@:native("flight_set_bitmap_font_kerning_pair_left") static function set_left(ptr:Dynamic, value:Int):Int;
	@:native("flight_get_bitmap_font_kerning_pair_right") static function get_right(ptr:Dynamic):Int;
	@:native("flight_set_bitmap_font_kerning_pair_right") static function set_right(ptr:Dynamic, value:Int):Int;
}

abstract BitmapFontKerningPair(Dynamic) {
	public var left(get, set):Int;

	inline function get_left():Int return BitmapFontKerningPair_Ffi.get_left(this);

	inline function set_left(value:Int):Int return BitmapFontKerningPair_Ffi.set_left(this, value);
	public var right(get, set):Int;

	inline function get_right():Int return BitmapFontKerningPair_Ffi.get_right(this);

	inline function set_right(value:Int):Int return BitmapFontKerningPair_Ffi.set_right(this, value);
}
