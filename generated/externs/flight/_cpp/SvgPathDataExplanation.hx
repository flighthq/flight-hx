package flight._cpp;

private extern class SvgPathDataExplanation_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_get_svg_path_data_explanation_position") static function get_position(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_svg_path_data_explanation_position") static function set_position(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_field_get_svg_path_data_explanation_reason") static function get_reason(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_svg_path_data_explanation_reason") static function set_reason(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
}

abstract SvgPathDataExplanation(cpp.Star<cpp.Void>) {
	public var position(get, set):Int;

	inline function get_position():Int return SvgPathDataExplanation_Ffi.get_position(this);

	inline function set_position(value:Int):Int { SvgPathDataExplanation_Ffi.set_position(this, value); return value; }
	public var reason(get, set):String;
	inline function get_reason():String { var raw = SvgPathDataExplanation_Ffi.get_reason(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); SvgPathDataExplanation_Ffi.freeString(raw); return value; }
	inline function set_reason(value:String):String { var raw:cpp.ConstCharStar = cast value; SvgPathDataExplanation_Ffi.set_reason(this, raw); return value; }
}
