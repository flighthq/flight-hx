package flight._cpp;

private extern class ScreenChangedMetrics_Ffi {
	@:native("flight_get_screen_changed_metrics_bounds") static function get_bounds(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_screen_changed_metrics_bounds") static function set_bounds(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_screen_changed_metrics_work_area") static function get_workArea(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_screen_changed_metrics_work_area") static function set_workArea(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_screen_changed_metrics_scale_factor") static function get_scaleFactor(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_screen_changed_metrics_scale_factor") static function set_scaleFactor(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_screen_changed_metrics_orientation") static function get_orientation(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_screen_changed_metrics_orientation") static function set_orientation(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
}

abstract ScreenChangedMetrics(cpp.Star<cpp.Void>) {
	public var bounds(get, set):Bool;

	inline function get_bounds():Bool return ScreenChangedMetrics_Ffi.get_bounds(this);

	inline function set_bounds(value:Bool):Bool { ScreenChangedMetrics_Ffi.set_bounds(this, value); return value; }
	public var workArea(get, set):Bool;

	inline function get_workArea():Bool return ScreenChangedMetrics_Ffi.get_workArea(this);

	inline function set_workArea(value:Bool):Bool { ScreenChangedMetrics_Ffi.set_workArea(this, value); return value; }
	public var scaleFactor(get, set):Bool;

	inline function get_scaleFactor():Bool return ScreenChangedMetrics_Ffi.get_scaleFactor(this);

	inline function set_scaleFactor(value:Bool):Bool { ScreenChangedMetrics_Ffi.set_scaleFactor(this, value); return value; }
	public var orientation(get, set):Bool;

	inline function get_orientation():Bool return ScreenChangedMetrics_Ffi.get_orientation(this);

	inline function set_orientation(value:Bool):Bool { ScreenChangedMetrics_Ffi.set_orientation(this, value); return value; }
}
