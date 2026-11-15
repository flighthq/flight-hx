package flight._js;

@:jsRequire("flight")
private extern class SvgStyle_Ffi {
	@:native("flight_get_svg_style_fill_opacity") static function get_fillOpacity(ptr:Dynamic):Float;
	@:native("flight_set_svg_style_fill_opacity") static function set_fillOpacity(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_svg_style_font_size") static function get_fontSize(ptr:Dynamic):Float;
	@:native("flight_set_svg_style_font_size") static function set_fontSize(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_svg_style_opacity") static function get_opacity(ptr:Dynamic):Float;
	@:native("flight_set_svg_style_opacity") static function set_opacity(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_svg_style_stroke_dashoffset") static function get_strokeDashoffset(ptr:Dynamic):Float;
	@:native("flight_set_svg_style_stroke_dashoffset") static function set_strokeDashoffset(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_svg_style_stroke_miterlimit") static function get_strokeMiterlimit(ptr:Dynamic):Float;
	@:native("flight_set_svg_style_stroke_miterlimit") static function set_strokeMiterlimit(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_svg_style_stroke_opacity") static function get_strokeOpacity(ptr:Dynamic):Float;
	@:native("flight_set_svg_style_stroke_opacity") static function set_strokeOpacity(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_svg_style_stroke_width") static function get_strokeWidth(ptr:Dynamic):Float;
	@:native("flight_set_svg_style_stroke_width") static function set_strokeWidth(ptr:Dynamic, value:Float):Float;
}

abstract SvgStyle(Dynamic) {
	public var fillOpacity(get, set):Float;

	inline function get_fillOpacity():Float return SvgStyle_Ffi.get_fillOpacity(this);

	inline function set_fillOpacity(value:Float):Float return SvgStyle_Ffi.set_fillOpacity(this, value);
	public var fontSize(get, set):Float;

	inline function get_fontSize():Float return SvgStyle_Ffi.get_fontSize(this);

	inline function set_fontSize(value:Float):Float return SvgStyle_Ffi.set_fontSize(this, value);
	public var opacity(get, set):Float;

	inline function get_opacity():Float return SvgStyle_Ffi.get_opacity(this);

	inline function set_opacity(value:Float):Float return SvgStyle_Ffi.set_opacity(this, value);
	public var strokeDashoffset(get, set):Float;

	inline function get_strokeDashoffset():Float return SvgStyle_Ffi.get_strokeDashoffset(this);

	inline function set_strokeDashoffset(value:Float):Float return SvgStyle_Ffi.set_strokeDashoffset(this, value);
	public var strokeMiterlimit(get, set):Float;

	inline function get_strokeMiterlimit():Float return SvgStyle_Ffi.get_strokeMiterlimit(this);

	inline function set_strokeMiterlimit(value:Float):Float return SvgStyle_Ffi.set_strokeMiterlimit(this, value);
	public var strokeOpacity(get, set):Float;

	inline function get_strokeOpacity():Float return SvgStyle_Ffi.get_strokeOpacity(this);

	inline function set_strokeOpacity(value:Float):Float return SvgStyle_Ffi.set_strokeOpacity(this, value);
	public var strokeWidth(get, set):Float;

	inline function get_strokeWidth():Float return SvgStyle_Ffi.get_strokeWidth(this);

	inline function set_strokeWidth(value:Float):Float return SvgStyle_Ffi.set_strokeWidth(this, value);
}
