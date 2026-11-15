package flight._cpp;

private extern class ColorLut_Ffi {
	@:native("flight_get_color_lut_size") static function get_size(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_color_lut_size") static function set_size(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract ColorLut(cpp.Star<cpp.Void>) {
	public var size(get, set):Int;

	inline function get_size():Int return ColorLut_Ffi.get_size(this);

	inline function set_size(value:Int):Int return ColorLut_Ffi.set_size(this, value);
}
