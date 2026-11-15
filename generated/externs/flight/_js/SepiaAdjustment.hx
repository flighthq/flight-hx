package flight._js;

@:jsRequire("flight")
private extern class SepiaAdjustment_Ffi {
	@:native("flight_get_sepia_adjustment_intensity") static function get_intensity(ptr:Dynamic):Float;
	@:native("flight_set_sepia_adjustment_intensity") static function set_intensity(ptr:Dynamic, value:Float):Float;
}

abstract SepiaAdjustment(Dynamic) {
	public var intensity(get, set):Float;

	inline function get_intensity():Float return SepiaAdjustment_Ffi.get_intensity(this);

	inline function set_intensity(value:Float):Float return SepiaAdjustment_Ffi.set_intensity(this, value);
}
