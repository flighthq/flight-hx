package flight._cpp;

private extern class SvgColor_Ffi {
	@:native("flight_get_svg_color_alpha") static function get_alpha(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_svg_color_alpha") static function set_alpha(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_svg_color_rgb") static function get_rgb(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_svg_color_rgb") static function set_rgb(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract SvgColor(cpp.Star<cpp.Void>) {
	public var alpha(get, set):Float;

	inline function get_alpha():Float return SvgColor_Ffi.get_alpha(this);

	inline function set_alpha(value:Float):Float { SvgColor_Ffi.set_alpha(this, value); return value; }
	public var rgb(get, set):Int;

	inline function get_rgb():Int return SvgColor_Ffi.get_rgb(this);

	inline function set_rgb(value:Int):Int { SvgColor_Ffi.set_rgb(this, value); return value; }
}
