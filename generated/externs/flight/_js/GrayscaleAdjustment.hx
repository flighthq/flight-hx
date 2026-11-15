package flight._js;

@:jsRequire("flight")
private extern class GrayscaleAdjustment_Ffi {
	@:native("flight_get_grayscale_adjustment_intensity") static function get_intensity(ptr:Dynamic):Float;
	@:native("flight_set_grayscale_adjustment_intensity") static function set_intensity(ptr:Dynamic, value:Float):Float;
}

abstract GrayscaleAdjustment(Dynamic) {
	public var intensity(get, set):Float;

	inline function get_intensity():Float return GrayscaleAdjustment_Ffi.get_intensity(this);

	inline function set_intensity(value:Float):Float return GrayscaleAdjustment_Ffi.set_intensity(this, value);
}
