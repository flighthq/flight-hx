package flight._cpp;

private extern class SvgPathDataExplanation_Ffi {
	@:native("flight_get_svg_path_data_explanation_position") static function get_position(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_svg_path_data_explanation_position") static function set_position(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract SvgPathDataExplanation(cpp.Star<cpp.Void>) {
	public var position(get, set):Int;

	inline function get_position():Int return SvgPathDataExplanation_Ffi.get_position(this);

	inline function set_position(value:Int):Int return SvgPathDataExplanation_Ffi.set_position(this, value);
}
