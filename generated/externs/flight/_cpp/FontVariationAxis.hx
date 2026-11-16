package flight._cpp;

private extern class FontVariationAxis_Ffi {
	@:native("flight_get_font_variation_axis_default_value") static function get_defaultValue(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_font_variation_axis_default_value") static function set_defaultValue(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_font_variation_axis_max") static function get_max(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_font_variation_axis_max") static function set_max(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_font_variation_axis_min") static function get_min(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_font_variation_axis_min") static function set_min(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract FontVariationAxis(cpp.Star<cpp.Void>) {
	public var defaultValue(get, set):Single;

	inline function get_defaultValue():Single return FontVariationAxis_Ffi.get_defaultValue(this);

	inline function set_defaultValue(value:Single):Single { FontVariationAxis_Ffi.set_defaultValue(this, value); return value; }
	public var max(get, set):Single;

	inline function get_max():Single return FontVariationAxis_Ffi.get_max(this);

	inline function set_max(value:Single):Single { FontVariationAxis_Ffi.set_max(this, value); return value; }
	public var min(get, set):Single;

	inline function get_min():Single return FontVariationAxis_Ffi.get_min(this);

	inline function set_min(value:Single):Single { FontVariationAxis_Ffi.set_min(this, value); return value; }
}
