package flight._cpp;

private extern class SvgGradient_Ffi {
	@:native("flight_get_svg_gradient_cx") static function get_cx(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_svg_gradient_cx") static function set_cx(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_svg_gradient_cy") static function get_cy(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_svg_gradient_cy") static function set_cy(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_svg_gradient_fx") static function get_fx(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_svg_gradient_fx") static function set_fx(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_svg_gradient_fy") static function get_fy(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_svg_gradient_fy") static function set_fy(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_svg_gradient_radius") static function get_radius(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_svg_gradient_radius") static function set_radius(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_svg_gradient_x1") static function get_x1(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_svg_gradient_x1") static function set_x1(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_svg_gradient_x2") static function get_x2(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_svg_gradient_x2") static function set_x2(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_svg_gradient_y1") static function get_y1(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_svg_gradient_y1") static function set_y1(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_svg_gradient_y2") static function get_y2(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_svg_gradient_y2") static function set_y2(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract SvgGradient(cpp.Star<cpp.Void>) {
	public var cx(get, set):Single;

	inline function get_cx():Single return SvgGradient_Ffi.get_cx(this);

	inline function set_cx(value:Single):Single { SvgGradient_Ffi.set_cx(this, value); return value; }
	public var cy(get, set):Single;

	inline function get_cy():Single return SvgGradient_Ffi.get_cy(this);

	inline function set_cy(value:Single):Single { SvgGradient_Ffi.set_cy(this, value); return value; }
	public var fx(get, set):Single;

	inline function get_fx():Single return SvgGradient_Ffi.get_fx(this);

	inline function set_fx(value:Single):Single { SvgGradient_Ffi.set_fx(this, value); return value; }
	public var fy(get, set):Single;

	inline function get_fy():Single return SvgGradient_Ffi.get_fy(this);

	inline function set_fy(value:Single):Single { SvgGradient_Ffi.set_fy(this, value); return value; }
	public var radius(get, set):Single;

	inline function get_radius():Single return SvgGradient_Ffi.get_radius(this);

	inline function set_radius(value:Single):Single { SvgGradient_Ffi.set_radius(this, value); return value; }
	public var x1(get, set):Single;

	inline function get_x1():Single return SvgGradient_Ffi.get_x1(this);

	inline function set_x1(value:Single):Single { SvgGradient_Ffi.set_x1(this, value); return value; }
	public var x2(get, set):Single;

	inline function get_x2():Single return SvgGradient_Ffi.get_x2(this);

	inline function set_x2(value:Single):Single { SvgGradient_Ffi.set_x2(this, value); return value; }
	public var y1(get, set):Single;

	inline function get_y1():Single return SvgGradient_Ffi.get_y1(this);

	inline function set_y1(value:Single):Single { SvgGradient_Ffi.set_y1(this, value); return value; }
	public var y2(get, set):Single;

	inline function get_y2():Single return SvgGradient_Ffi.get_y2(this);

	inline function set_y2(value:Single):Single { SvgGradient_Ffi.set_y2(this, value); return value; }
}
