package flight._js;

@:jsRequire("flight")
private extern class LibgdxRangeValue_Ffi {
	@:native("flight_get_libgdx_range_value_low_min") static function get_lowMin(ptr:Dynamic):Float;
	@:native("flight_set_libgdx_range_value_low_min") static function set_lowMin(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_libgdx_range_value_low_max") static function get_lowMax(ptr:Dynamic):Float;
	@:native("flight_set_libgdx_range_value_low_max") static function set_lowMax(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_libgdx_range_value_high_min") static function get_highMin(ptr:Dynamic):Float;
	@:native("flight_set_libgdx_range_value_high_min") static function set_highMin(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_libgdx_range_value_high_max") static function get_highMax(ptr:Dynamic):Float;
	@:native("flight_set_libgdx_range_value_high_max") static function set_highMax(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_libgdx_range_value_relative") static function get_relative(ptr:Dynamic):Bool;
	@:native("flight_set_libgdx_range_value_relative") static function set_relative(ptr:Dynamic, value:Bool):Bool;
}

abstract LibgdxRangeValue(Dynamic) {
	public var lowMin(get, set):Float;

	inline function get_lowMin():Float return LibgdxRangeValue_Ffi.get_lowMin(this);

	inline function set_lowMin(value:Float):Float return LibgdxRangeValue_Ffi.set_lowMin(this, value);
	public var lowMax(get, set):Float;

	inline function get_lowMax():Float return LibgdxRangeValue_Ffi.get_lowMax(this);

	inline function set_lowMax(value:Float):Float return LibgdxRangeValue_Ffi.set_lowMax(this, value);
	public var highMin(get, set):Float;

	inline function get_highMin():Float return LibgdxRangeValue_Ffi.get_highMin(this);

	inline function set_highMin(value:Float):Float return LibgdxRangeValue_Ffi.set_highMin(this, value);
	public var highMax(get, set):Float;

	inline function get_highMax():Float return LibgdxRangeValue_Ffi.get_highMax(this);

	inline function set_highMax(value:Float):Float return LibgdxRangeValue_Ffi.set_highMax(this, value);
	public var relative(get, set):Bool;

	inline function get_relative():Bool return LibgdxRangeValue_Ffi.get_relative(this);

	inline function set_relative(value:Bool):Bool return LibgdxRangeValue_Ffi.set_relative(this, value);
}
