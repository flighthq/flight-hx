package flight._js;

@:jsRequire("flight")
private extern class BitmapFontKerningData_Ffi {
	@:native("flight_get_bitmap_font_kerning_data_amount") static function get_amount(ptr:Dynamic):Float;
	@:native("flight_set_bitmap_font_kerning_data_amount") static function set_amount(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_bitmap_font_kerning_data_left") static function get_left(ptr:Dynamic):Int;
	@:native("flight_set_bitmap_font_kerning_data_left") static function set_left(ptr:Dynamic, value:Int):Int;
	@:native("flight_get_bitmap_font_kerning_data_right") static function get_right(ptr:Dynamic):Int;
	@:native("flight_set_bitmap_font_kerning_data_right") static function set_right(ptr:Dynamic, value:Int):Int;
}

abstract BitmapFontKerningData(Dynamic) {
	public var amount(get, set):Float;

	inline function get_amount():Float return BitmapFontKerningData_Ffi.get_amount(this);

	inline function set_amount(value:Float):Float return BitmapFontKerningData_Ffi.set_amount(this, value);
	public var left(get, set):Int;

	inline function get_left():Int return BitmapFontKerningData_Ffi.get_left(this);

	inline function set_left(value:Int):Int return BitmapFontKerningData_Ffi.set_left(this, value);
	public var right(get, set):Int;

	inline function get_right():Int return BitmapFontKerningData_Ffi.get_right(this);

	inline function set_right(value:Int):Int return BitmapFontKerningData_Ffi.set_right(this, value);
}
