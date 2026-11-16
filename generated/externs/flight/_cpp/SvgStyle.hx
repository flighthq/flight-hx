package flight._cpp;

private extern class SvgStyle_Ffi {
	@:native("flight_get_svg_style_fill_opacity") static function get_fillOpacity(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_svg_style_fill_opacity") static function set_fillOpacity(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_svg_style_font_size") static function get_fontSize(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_svg_style_font_size") static function set_fontSize(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_svg_style_opacity") static function get_opacity(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_svg_style_opacity") static function set_opacity(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_svg_style_stroke_dashoffset") static function get_strokeDashoffset(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_svg_style_stroke_dashoffset") static function set_strokeDashoffset(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_svg_style_stroke_miterlimit") static function get_strokeMiterlimit(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_svg_style_stroke_miterlimit") static function set_strokeMiterlimit(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_svg_style_stroke_opacity") static function get_strokeOpacity(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_svg_style_stroke_opacity") static function set_strokeOpacity(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_svg_style_stroke_width") static function get_strokeWidth(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_svg_style_stroke_width") static function set_strokeWidth(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract SvgStyle(cpp.Star<cpp.Void>) {
	public var fillOpacity(get, set):Single;

	inline function get_fillOpacity():Single return SvgStyle_Ffi.get_fillOpacity(this);

	inline function set_fillOpacity(value:Single):Single { SvgStyle_Ffi.set_fillOpacity(this, value); return value; }
	public var fontSize(get, set):Single;

	inline function get_fontSize():Single return SvgStyle_Ffi.get_fontSize(this);

	inline function set_fontSize(value:Single):Single { SvgStyle_Ffi.set_fontSize(this, value); return value; }
	public var opacity(get, set):Single;

	inline function get_opacity():Single return SvgStyle_Ffi.get_opacity(this);

	inline function set_opacity(value:Single):Single { SvgStyle_Ffi.set_opacity(this, value); return value; }
	public var strokeDashoffset(get, set):Single;

	inline function get_strokeDashoffset():Single return SvgStyle_Ffi.get_strokeDashoffset(this);

	inline function set_strokeDashoffset(value:Single):Single { SvgStyle_Ffi.set_strokeDashoffset(this, value); return value; }
	public var strokeMiterlimit(get, set):Single;

	inline function get_strokeMiterlimit():Single return SvgStyle_Ffi.get_strokeMiterlimit(this);

	inline function set_strokeMiterlimit(value:Single):Single { SvgStyle_Ffi.set_strokeMiterlimit(this, value); return value; }
	public var strokeOpacity(get, set):Single;

	inline function get_strokeOpacity():Single return SvgStyle_Ffi.get_strokeOpacity(this);

	inline function set_strokeOpacity(value:Single):Single { SvgStyle_Ffi.set_strokeOpacity(this, value); return value; }
	public var strokeWidth(get, set):Single;

	inline function get_strokeWidth():Single return SvgStyle_Ffi.get_strokeWidth(this);

	inline function set_strokeWidth(value:Single):Single { SvgStyle_Ffi.set_strokeWidth(this, value); return value; }
}
