package flight._js;

@:jsRequire("flight")
private extern class FontVariationAxis_Ffi {
	@:native("flight_get_font_variation_axis_default_value") static function get_defaultValue(ptr:Dynamic):Float;
	@:native("flight_set_font_variation_axis_default_value") static function set_defaultValue(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_font_variation_axis_max") static function get_max(ptr:Dynamic):Float;
	@:native("flight_set_font_variation_axis_max") static function set_max(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_font_variation_axis_min") static function get_min(ptr:Dynamic):Float;
	@:native("flight_set_font_variation_axis_min") static function set_min(ptr:Dynamic, value:Float):Float;
}

abstract FontVariationAxis(Dynamic) {
	public var defaultValue(get, set):Float;

	inline function get_defaultValue():Float return FontVariationAxis_Ffi.get_defaultValue(this);

	inline function set_defaultValue(value:Float):Float return FontVariationAxis_Ffi.set_defaultValue(this, value);
	public var max(get, set):Float;

	inline function get_max():Float return FontVariationAxis_Ffi.get_max(this);

	inline function set_max(value:Float):Float return FontVariationAxis_Ffi.set_max(this, value);
	public var min(get, set):Float;

	inline function get_min():Float return FontVariationAxis_Ffi.get_min(this);

	inline function set_min(value:Float):Float return FontVariationAxis_Ffi.set_min(this, value);
}
