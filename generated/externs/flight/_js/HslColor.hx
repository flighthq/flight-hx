package flight._js;

@:jsRequire("flight")
private extern class HslColor_Ffi {
	@:native("flight_get_hsl_color_h") static function get_h(ptr:Dynamic):Float;
	@:native("flight_set_hsl_color_h") static function set_h(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_hsl_color_s") static function get_s(ptr:Dynamic):Float;
	@:native("flight_set_hsl_color_s") static function set_s(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_hsl_color_l") static function get_l(ptr:Dynamic):Float;
	@:native("flight_set_hsl_color_l") static function set_l(ptr:Dynamic, value:Float):Float;
}

abstract HslColor(Dynamic) {
	public var h(get, set):Float;

	inline function get_h():Float return HslColor_Ffi.get_h(this);

	inline function set_h(value:Float):Float return HslColor_Ffi.set_h(this, value);
	public var s(get, set):Float;

	inline function get_s():Float return HslColor_Ffi.get_s(this);

	inline function set_s(value:Float):Float return HslColor_Ffi.set_s(this, value);
	public var l(get, set):Float;

	inline function get_l():Float return HslColor_Ffi.get_l(this);

	inline function set_l(value:Float):Float return HslColor_Ffi.set_l(this, value);
}
