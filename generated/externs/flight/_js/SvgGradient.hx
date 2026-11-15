package flight._js;

@:jsRequire("flight")
private extern class SvgGradient_Ffi {
	@:native("flight_get_svg_gradient_cx") static function get_cx(ptr:Dynamic):Float;
	@:native("flight_set_svg_gradient_cx") static function set_cx(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_svg_gradient_cy") static function get_cy(ptr:Dynamic):Float;
	@:native("flight_set_svg_gradient_cy") static function set_cy(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_svg_gradient_fx") static function get_fx(ptr:Dynamic):Float;
	@:native("flight_set_svg_gradient_fx") static function set_fx(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_svg_gradient_fy") static function get_fy(ptr:Dynamic):Float;
	@:native("flight_set_svg_gradient_fy") static function set_fy(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_svg_gradient_radius") static function get_radius(ptr:Dynamic):Float;
	@:native("flight_set_svg_gradient_radius") static function set_radius(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_svg_gradient_x1") static function get_x1(ptr:Dynamic):Float;
	@:native("flight_set_svg_gradient_x1") static function set_x1(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_svg_gradient_x2") static function get_x2(ptr:Dynamic):Float;
	@:native("flight_set_svg_gradient_x2") static function set_x2(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_svg_gradient_y1") static function get_y1(ptr:Dynamic):Float;
	@:native("flight_set_svg_gradient_y1") static function set_y1(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_svg_gradient_y2") static function get_y2(ptr:Dynamic):Float;
	@:native("flight_set_svg_gradient_y2") static function set_y2(ptr:Dynamic, value:Float):Float;
}

abstract SvgGradient(Dynamic) {
	public var cx(get, set):Float;

	inline function get_cx():Float return SvgGradient_Ffi.get_cx(this);

	inline function set_cx(value:Float):Float return SvgGradient_Ffi.set_cx(this, value);
	public var cy(get, set):Float;

	inline function get_cy():Float return SvgGradient_Ffi.get_cy(this);

	inline function set_cy(value:Float):Float return SvgGradient_Ffi.set_cy(this, value);
	public var fx(get, set):Float;

	inline function get_fx():Float return SvgGradient_Ffi.get_fx(this);

	inline function set_fx(value:Float):Float return SvgGradient_Ffi.set_fx(this, value);
	public var fy(get, set):Float;

	inline function get_fy():Float return SvgGradient_Ffi.get_fy(this);

	inline function set_fy(value:Float):Float return SvgGradient_Ffi.set_fy(this, value);
	public var radius(get, set):Float;

	inline function get_radius():Float return SvgGradient_Ffi.get_radius(this);

	inline function set_radius(value:Float):Float return SvgGradient_Ffi.set_radius(this, value);
	public var x1(get, set):Float;

	inline function get_x1():Float return SvgGradient_Ffi.get_x1(this);

	inline function set_x1(value:Float):Float return SvgGradient_Ffi.set_x1(this, value);
	public var x2(get, set):Float;

	inline function get_x2():Float return SvgGradient_Ffi.get_x2(this);

	inline function set_x2(value:Float):Float return SvgGradient_Ffi.set_x2(this, value);
	public var y1(get, set):Float;

	inline function get_y1():Float return SvgGradient_Ffi.get_y1(this);

	inline function set_y1(value:Float):Float return SvgGradient_Ffi.set_y1(this, value);
	public var y2(get, set):Float;

	inline function get_y2():Float return SvgGradient_Ffi.get_y2(this);

	inline function set_y2(value:Float):Float return SvgGradient_Ffi.set_y2(this, value);
}
