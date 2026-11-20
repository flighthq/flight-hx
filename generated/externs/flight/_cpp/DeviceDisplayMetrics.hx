package flight._cpp;

private extern class DeviceDisplayMetrics_Ffi {
	@:native("flight_get_device_display_metrics_color_depth") static function get_colorDepth(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_device_display_metrics_color_depth") static function set_colorDepth(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_device_display_metrics_density_dpi") static function get_densityDpi(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_device_display_metrics_density_dpi") static function set_densityDpi(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_device_display_metrics_logical_height") static function get_logicalHeight(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_device_display_metrics_logical_height") static function set_logicalHeight(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_device_display_metrics_logical_width") static function get_logicalWidth(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_device_display_metrics_logical_width") static function set_logicalWidth(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_device_display_metrics_physical_height") static function get_physicalHeight(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_device_display_metrics_physical_height") static function set_physicalHeight(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_device_display_metrics_physical_width") static function get_physicalWidth(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_device_display_metrics_physical_width") static function set_physicalWidth(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_device_display_metrics_pixel_ratio") static function get_pixelRatio(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_device_display_metrics_pixel_ratio") static function set_pixelRatio(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract DeviceDisplayMetrics(cpp.Star<cpp.Void>) {
	public var colorDepth(get, set):Int;

	inline function get_colorDepth():Int return DeviceDisplayMetrics_Ffi.get_colorDepth(this);

	inline function set_colorDepth(value:Int):Int { DeviceDisplayMetrics_Ffi.set_colorDepth(this, value); return value; }
	public var densityDpi(get, set):Single;

	inline function get_densityDpi():Single return DeviceDisplayMetrics_Ffi.get_densityDpi(this);

	inline function set_densityDpi(value:Single):Single { DeviceDisplayMetrics_Ffi.set_densityDpi(this, value); return value; }
	public var logicalHeight(get, set):Single;

	inline function get_logicalHeight():Single return DeviceDisplayMetrics_Ffi.get_logicalHeight(this);

	inline function set_logicalHeight(value:Single):Single { DeviceDisplayMetrics_Ffi.set_logicalHeight(this, value); return value; }
	public var logicalWidth(get, set):Single;

	inline function get_logicalWidth():Single return DeviceDisplayMetrics_Ffi.get_logicalWidth(this);

	inline function set_logicalWidth(value:Single):Single { DeviceDisplayMetrics_Ffi.set_logicalWidth(this, value); return value; }
	public var physicalHeight(get, set):Single;

	inline function get_physicalHeight():Single return DeviceDisplayMetrics_Ffi.get_physicalHeight(this);

	inline function set_physicalHeight(value:Single):Single { DeviceDisplayMetrics_Ffi.set_physicalHeight(this, value); return value; }
	public var physicalWidth(get, set):Single;

	inline function get_physicalWidth():Single return DeviceDisplayMetrics_Ffi.get_physicalWidth(this);

	inline function set_physicalWidth(value:Single):Single { DeviceDisplayMetrics_Ffi.set_physicalWidth(this, value); return value; }
	public var pixelRatio(get, set):Single;

	inline function get_pixelRatio():Single return DeviceDisplayMetrics_Ffi.get_pixelRatio(this);

	inline function set_pixelRatio(value:Single):Single { DeviceDisplayMetrics_Ffi.set_pixelRatio(this, value); return value; }
}
