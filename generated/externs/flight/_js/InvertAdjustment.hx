package flight._js;

@:jsRequire("flight")
private extern class InvertAdjustment_Ffi {
	@:native("flight_get_invert_adjustment_intensity") static function get_intensity(ptr:Dynamic):Float;
	@:native("flight_set_invert_adjustment_intensity") static function set_intensity(ptr:Dynamic, value:Float):Float;
}

abstract InvertAdjustment(Dynamic) {
	public var intensity(get, set):Float;

	inline function get_intensity():Float return InvertAdjustment_Ffi.get_intensity(this);

	inline function set_intensity(value:Float):Float return InvertAdjustment_Ffi.set_intensity(this, value);
}
