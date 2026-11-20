package flight._cpp;

private extern class CanvasTextMetrics_Ffi {
	@:native("flight_get_canvas_text_metrics_width") static function get_width(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_canvas_text_metrics_width") static function set_width(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract CanvasTextMetrics(cpp.Star<cpp.Void>) {
	public var width(get, set):Single;

	inline function get_width():Single return CanvasTextMetrics_Ffi.get_width(this);

	inline function set_width(value:Single):Single { CanvasTextMetrics_Ffi.set_width(this, value); return value; }
}
