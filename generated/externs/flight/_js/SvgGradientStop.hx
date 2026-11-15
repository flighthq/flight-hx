package flight._js;

@:jsRequire("flight")
private extern class SvgGradientStop_Ffi {
	@:native("flight_get_svg_gradient_stop_offset") static function get_offset(ptr:Dynamic):Float;
	@:native("flight_set_svg_gradient_stop_offset") static function set_offset(ptr:Dynamic, value:Float):Float;
}

abstract SvgGradientStop(Dynamic) {
	public var offset(get, set):Float;

	inline function get_offset():Float return SvgGradientStop_Ffi.get_offset(this);

	inline function set_offset(value:Float):Float return SvgGradientStop_Ffi.set_offset(this, value);
}
