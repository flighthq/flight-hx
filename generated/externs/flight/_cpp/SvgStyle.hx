package flight._cpp;

private extern class SvgStyle_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_field_get_svg_style_color") static function get_color(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_svg_style_color") static function set_color(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_field_get_svg_style_display") static function get_display(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_svg_style_display") static function set_display(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_field_get_svg_style_fill") static function get_fill(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_svg_style_fill") static function set_fill(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_get_svg_style_fill_opacity") static function get_fillOpacity(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_svg_style_fill_opacity") static function set_fillOpacity(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_field_get_svg_style_filter") static function get_filter(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_svg_style_filter") static function set_filter(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_field_get_svg_style_font_family") static function get_fontFamily(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_svg_style_font_family") static function set_fontFamily(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_get_svg_style_font_size") static function get_fontSize(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_svg_style_font_size") static function set_fontSize(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_field_get_svg_style_font_style") static function get_fontStyle(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_svg_style_font_style") static function set_fontStyle(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_field_get_svg_style_font_weight") static function get_fontWeight(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_svg_style_font_weight") static function set_fontWeight(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_get_svg_style_opacity") static function get_opacity(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_svg_style_opacity") static function set_opacity(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_field_get_svg_style_stroke") static function get_stroke(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_svg_style_stroke") static function set_stroke(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_field_get_svg_style_stroke_dasharray") static function get_strokeDasharray(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_svg_style_stroke_dasharray") static function set_strokeDasharray(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_get_svg_style_stroke_dashoffset") static function get_strokeDashoffset(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_svg_style_stroke_dashoffset") static function set_strokeDashoffset(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_field_get_svg_style_stroke_linecap") static function get_strokeLinecap(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_svg_style_stroke_linecap") static function set_strokeLinecap(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_field_get_svg_style_stroke_linejoin") static function get_strokeLinejoin(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_svg_style_stroke_linejoin") static function set_strokeLinejoin(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_get_svg_style_stroke_miterlimit") static function get_strokeMiterlimit(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_svg_style_stroke_miterlimit") static function set_strokeMiterlimit(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_svg_style_stroke_opacity") static function get_strokeOpacity(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_svg_style_stroke_opacity") static function set_strokeOpacity(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_svg_style_stroke_width") static function get_strokeWidth(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_svg_style_stroke_width") static function set_strokeWidth(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_field_get_svg_style_text_anchor") static function get_textAnchor(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_svg_style_text_anchor") static function set_textAnchor(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_field_get_svg_style_visibility") static function get_visibility(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_svg_style_visibility") static function set_visibility(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
}

abstract SvgStyle(cpp.Star<cpp.Void>) {
	public var color(get, set):String;
	inline function get_color():String { var raw = SvgStyle_Ffi.get_color(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); SvgStyle_Ffi.freeString(raw); return value; }
	inline function set_color(value:String):String { var raw:cpp.ConstCharStar = cast value; SvgStyle_Ffi.set_color(this, raw); return value; }
	public var display(get, set):String;
	inline function get_display():String { var raw = SvgStyle_Ffi.get_display(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); SvgStyle_Ffi.freeString(raw); return value; }
	inline function set_display(value:String):String { var raw:cpp.ConstCharStar = cast value; SvgStyle_Ffi.set_display(this, raw); return value; }
	public var fill(get, set):String;
	inline function get_fill():String { var raw = SvgStyle_Ffi.get_fill(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); SvgStyle_Ffi.freeString(raw); return value; }
	inline function set_fill(value:String):String { var raw:cpp.ConstCharStar = cast value; SvgStyle_Ffi.set_fill(this, raw); return value; }
	public var fillOpacity(get, set):Float;

	inline function get_fillOpacity():Float return SvgStyle_Ffi.get_fillOpacity(this);

	inline function set_fillOpacity(value:Float):Float { SvgStyle_Ffi.set_fillOpacity(this, value); return value; }
	public var filter(get, set):String;
	inline function get_filter():String { var raw = SvgStyle_Ffi.get_filter(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); SvgStyle_Ffi.freeString(raw); return value; }
	inline function set_filter(value:String):String { var raw:cpp.ConstCharStar = cast value; SvgStyle_Ffi.set_filter(this, raw); return value; }
	public var fontFamily(get, set):String;
	inline function get_fontFamily():String { var raw = SvgStyle_Ffi.get_fontFamily(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); SvgStyle_Ffi.freeString(raw); return value; }
	inline function set_fontFamily(value:String):String { var raw:cpp.ConstCharStar = cast value; SvgStyle_Ffi.set_fontFamily(this, raw); return value; }
	public var fontSize(get, set):Float;

	inline function get_fontSize():Float return SvgStyle_Ffi.get_fontSize(this);

	inline function set_fontSize(value:Float):Float { SvgStyle_Ffi.set_fontSize(this, value); return value; }
	public var fontStyle(get, set):String;
	inline function get_fontStyle():String { var raw = SvgStyle_Ffi.get_fontStyle(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); SvgStyle_Ffi.freeString(raw); return value; }
	inline function set_fontStyle(value:String):String { var raw:cpp.ConstCharStar = cast value; SvgStyle_Ffi.set_fontStyle(this, raw); return value; }
	public var fontWeight(get, set):String;
	inline function get_fontWeight():String { var raw = SvgStyle_Ffi.get_fontWeight(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); SvgStyle_Ffi.freeString(raw); return value; }
	inline function set_fontWeight(value:String):String { var raw:cpp.ConstCharStar = cast value; SvgStyle_Ffi.set_fontWeight(this, raw); return value; }
	public var opacity(get, set):Float;

	inline function get_opacity():Float return SvgStyle_Ffi.get_opacity(this);

	inline function set_opacity(value:Float):Float { SvgStyle_Ffi.set_opacity(this, value); return value; }
	public var stroke(get, set):String;
	inline function get_stroke():String { var raw = SvgStyle_Ffi.get_stroke(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); SvgStyle_Ffi.freeString(raw); return value; }
	inline function set_stroke(value:String):String { var raw:cpp.ConstCharStar = cast value; SvgStyle_Ffi.set_stroke(this, raw); return value; }
	public var strokeDasharray(get, set):String;
	inline function get_strokeDasharray():String { var raw = SvgStyle_Ffi.get_strokeDasharray(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); SvgStyle_Ffi.freeString(raw); return value; }
	inline function set_strokeDasharray(value:String):String { var raw:cpp.ConstCharStar = cast value; SvgStyle_Ffi.set_strokeDasharray(this, raw); return value; }
	public var strokeDashoffset(get, set):Float;

	inline function get_strokeDashoffset():Float return SvgStyle_Ffi.get_strokeDashoffset(this);

	inline function set_strokeDashoffset(value:Float):Float { SvgStyle_Ffi.set_strokeDashoffset(this, value); return value; }
	public var strokeLinecap(get, set):String;
	inline function get_strokeLinecap():String { var raw = SvgStyle_Ffi.get_strokeLinecap(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); SvgStyle_Ffi.freeString(raw); return value; }
	inline function set_strokeLinecap(value:String):String { var raw:cpp.ConstCharStar = cast value; SvgStyle_Ffi.set_strokeLinecap(this, raw); return value; }
	public var strokeLinejoin(get, set):String;
	inline function get_strokeLinejoin():String { var raw = SvgStyle_Ffi.get_strokeLinejoin(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); SvgStyle_Ffi.freeString(raw); return value; }
	inline function set_strokeLinejoin(value:String):String { var raw:cpp.ConstCharStar = cast value; SvgStyle_Ffi.set_strokeLinejoin(this, raw); return value; }
	public var strokeMiterlimit(get, set):Float;

	inline function get_strokeMiterlimit():Float return SvgStyle_Ffi.get_strokeMiterlimit(this);

	inline function set_strokeMiterlimit(value:Float):Float { SvgStyle_Ffi.set_strokeMiterlimit(this, value); return value; }
	public var strokeOpacity(get, set):Float;

	inline function get_strokeOpacity():Float return SvgStyle_Ffi.get_strokeOpacity(this);

	inline function set_strokeOpacity(value:Float):Float { SvgStyle_Ffi.set_strokeOpacity(this, value); return value; }
	public var strokeWidth(get, set):Float;

	inline function get_strokeWidth():Float return SvgStyle_Ffi.get_strokeWidth(this);

	inline function set_strokeWidth(value:Float):Float { SvgStyle_Ffi.set_strokeWidth(this, value); return value; }
	public var textAnchor(get, set):String;
	inline function get_textAnchor():String { var raw = SvgStyle_Ffi.get_textAnchor(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); SvgStyle_Ffi.freeString(raw); return value; }
	inline function set_textAnchor(value:String):String { var raw:cpp.ConstCharStar = cast value; SvgStyle_Ffi.set_textAnchor(this, raw); return value; }
	public var visibility(get, set):String;
	inline function get_visibility():String { var raw = SvgStyle_Ffi.get_visibility(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); SvgStyle_Ffi.freeString(raw); return value; }
	inline function set_visibility(value:String):String { var raw:cpp.ConstCharStar = cast value; SvgStyle_Ffi.set_visibility(this, raw); return value; }
}
