package flight._cpp;

private extern class TextLineMetrics_Ffi {
	@:native("flight_get_text_line_metrics_ascent") static function get_ascent(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_text_line_metrics_ascent") static function set_ascent(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_text_line_metrics_descent") static function get_descent(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_text_line_metrics_descent") static function set_descent(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_text_line_metrics_height") static function get_height(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_text_line_metrics_height") static function set_height(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_text_line_metrics_leading") static function get_leading(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_text_line_metrics_leading") static function set_leading(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_text_line_metrics_width") static function get_width(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_text_line_metrics_width") static function set_width(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_text_line_metrics_x") static function get_x(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_text_line_metrics_x") static function set_x(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract TextLineMetrics(cpp.Star<cpp.Void>) {
	public var ascent(get, set):Single;

	inline function get_ascent():Single return TextLineMetrics_Ffi.get_ascent(this);

	inline function set_ascent(value:Single):Single { TextLineMetrics_Ffi.set_ascent(this, value); return value; }
	public var descent(get, set):Single;

	inline function get_descent():Single return TextLineMetrics_Ffi.get_descent(this);

	inline function set_descent(value:Single):Single { TextLineMetrics_Ffi.set_descent(this, value); return value; }
	public var height(get, set):Single;

	inline function get_height():Single return TextLineMetrics_Ffi.get_height(this);

	inline function set_height(value:Single):Single { TextLineMetrics_Ffi.set_height(this, value); return value; }
	public var leading(get, set):Single;

	inline function get_leading():Single return TextLineMetrics_Ffi.get_leading(this);

	inline function set_leading(value:Single):Single { TextLineMetrics_Ffi.set_leading(this, value); return value; }
	public var width(get, set):Single;

	inline function get_width():Single return TextLineMetrics_Ffi.get_width(this);

	inline function set_width(value:Single):Single { TextLineMetrics_Ffi.set_width(this, value); return value; }
	public var x(get, set):Single;

	inline function get_x():Single return TextLineMetrics_Ffi.get_x(this);

	inline function set_x(value:Single):Single { TextLineMetrics_Ffi.set_x(this, value); return value; }
}
