package flight._js;

@:jsRequire("flight")
private extern class SvgColor_Ffi {
	@:native("flight_get_svg_color_alpha") static function get_alpha(ptr:Dynamic):Float;
	@:native("flight_set_svg_color_alpha") static function set_alpha(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_svg_color_rgb") static function get_rgb(ptr:Dynamic):Int;
	@:native("flight_set_svg_color_rgb") static function set_rgb(ptr:Dynamic, value:Int):Int;
}

abstract SvgColor(Dynamic) {
	public var alpha(get, set):Float;

	inline function get_alpha():Float return SvgColor_Ffi.get_alpha(this);

	inline function set_alpha(value:Float):Float return SvgColor_Ffi.set_alpha(this, value);
	public var rgb(get, set):Int;

	inline function get_rgb():Int return SvgColor_Ffi.get_rgb(this);

	inline function set_rgb(value:Int):Int return SvgColor_Ffi.set_rgb(this, value);
}
