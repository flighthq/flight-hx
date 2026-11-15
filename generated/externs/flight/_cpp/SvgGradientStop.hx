package flight._cpp;

private extern class SvgGradientStop_Ffi {
	@:native("flight_get_svg_gradient_stop_offset") static function get_offset(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_svg_gradient_stop_offset") static function set_offset(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract SvgGradientStop(cpp.Star<cpp.Void>) {
	public var offset(get, set):Single;

	inline function get_offset():Single return SvgGradientStop_Ffi.get_offset(this);

	inline function set_offset(value:Single):Single return SvgGradientStop_Ffi.set_offset(this, value);
}
