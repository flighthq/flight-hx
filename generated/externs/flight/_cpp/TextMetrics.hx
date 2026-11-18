package flight._cpp;

private extern class TextMetrics_Ffi {
	@:native("flight_get_text_metrics_height") static function get_height(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_text_metrics_height") static function set_height(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_text_metrics_num_lines") static function get_numLines(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_text_metrics_num_lines") static function set_numLines(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_text_metrics_width") static function get_width(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_text_metrics_width") static function set_width(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract TextMetrics(cpp.Star<cpp.Void>) {
	public var height(get, set):Single;

	inline function get_height():Single return TextMetrics_Ffi.get_height(this);

	inline function set_height(value:Single):Single { TextMetrics_Ffi.set_height(this, value); return value; }
	public var numLines(get, set):Int;

	inline function get_numLines():Int return TextMetrics_Ffi.get_numLines(this);

	inline function set_numLines(value:Int):Int { TextMetrics_Ffi.set_numLines(this, value); return value; }
	public var width(get, set):Single;

	inline function get_width():Single return TextMetrics_Ffi.get_width(this);

	inline function set_width(value:Single):Single { TextMetrics_Ffi.set_width(this, value); return value; }
}
