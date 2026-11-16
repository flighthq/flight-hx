package flight._cpp;

private extern class LibgdxActiveRangeValue_Ffi {
	@:native("flight_get_libgdx_active_range_value_active") static function get_active(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_libgdx_active_range_value_active") static function set_active(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_libgdx_active_range_value_low_min") static function get_lowMin(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_libgdx_active_range_value_low_min") static function set_lowMin(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_libgdx_active_range_value_low_max") static function get_lowMax(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_libgdx_active_range_value_low_max") static function set_lowMax(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_libgdx_active_range_value_high_min") static function get_highMin(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_libgdx_active_range_value_high_min") static function set_highMin(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_libgdx_active_range_value_high_max") static function get_highMax(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_libgdx_active_range_value_high_max") static function set_highMax(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_libgdx_active_range_value_relative") static function get_relative(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_libgdx_active_range_value_relative") static function set_relative(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
}

abstract LibgdxActiveRangeValue(cpp.Star<cpp.Void>) {
	public var active(get, set):Bool;

	inline function get_active():Bool return LibgdxActiveRangeValue_Ffi.get_active(this);

	inline function set_active(value:Bool):Bool { LibgdxActiveRangeValue_Ffi.set_active(this, value); return value; }
	public var lowMin(get, set):Single;

	inline function get_lowMin():Single return LibgdxActiveRangeValue_Ffi.get_lowMin(this);

	inline function set_lowMin(value:Single):Single { LibgdxActiveRangeValue_Ffi.set_lowMin(this, value); return value; }
	public var lowMax(get, set):Single;

	inline function get_lowMax():Single return LibgdxActiveRangeValue_Ffi.get_lowMax(this);

	inline function set_lowMax(value:Single):Single { LibgdxActiveRangeValue_Ffi.set_lowMax(this, value); return value; }
	public var highMin(get, set):Single;

	inline function get_highMin():Single return LibgdxActiveRangeValue_Ffi.get_highMin(this);

	inline function set_highMin(value:Single):Single { LibgdxActiveRangeValue_Ffi.set_highMin(this, value); return value; }
	public var highMax(get, set):Single;

	inline function get_highMax():Single return LibgdxActiveRangeValue_Ffi.get_highMax(this);

	inline function set_highMax(value:Single):Single { LibgdxActiveRangeValue_Ffi.set_highMax(this, value); return value; }
	public var relative(get, set):Bool;

	inline function get_relative():Bool return LibgdxActiveRangeValue_Ffi.get_relative(this);

	inline function set_relative(value:Bool):Bool { LibgdxActiveRangeValue_Ffi.set_relative(this, value); return value; }
}
