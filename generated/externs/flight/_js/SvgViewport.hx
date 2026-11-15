package flight._js;

@:jsRequire("flight")
private extern class SvgViewport_Ffi {
	@:native("flight_get_svg_viewport_height") static function get_height(ptr:Dynamic):Float;
	@:native("flight_set_svg_viewport_height") static function set_height(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_svg_viewport_width") static function get_width(ptr:Dynamic):Float;
	@:native("flight_set_svg_viewport_width") static function set_width(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_svg_viewport_x") static function get_x(ptr:Dynamic):Float;
	@:native("flight_set_svg_viewport_x") static function set_x(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_svg_viewport_y") static function get_y(ptr:Dynamic):Float;
	@:native("flight_set_svg_viewport_y") static function set_y(ptr:Dynamic, value:Float):Float;
}

abstract SvgViewport(Dynamic) {
	public var height(get, set):Float;

	inline function get_height():Float return SvgViewport_Ffi.get_height(this);

	inline function set_height(value:Float):Float return SvgViewport_Ffi.set_height(this, value);
	public var width(get, set):Float;

	inline function get_width():Float return SvgViewport_Ffi.get_width(this);

	inline function set_width(value:Float):Float return SvgViewport_Ffi.set_width(this, value);
	public var x(get, set):Float;

	inline function get_x():Float return SvgViewport_Ffi.get_x(this);

	inline function set_x(value:Float):Float return SvgViewport_Ffi.set_x(this, value);
	public var y(get, set):Float;

	inline function get_y():Float return SvgViewport_Ffi.get_y(this);

	inline function set_y(value:Float):Float return SvgViewport_Ffi.set_y(this, value);
}
