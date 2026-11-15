package flight._js;

@:jsRequire("flight")
private extern class ExposureAdjustment_Ffi {
	@:native("flight_get_exposure_adjustment_exposure") static function get_exposure(ptr:Dynamic):Float;
	@:native("flight_set_exposure_adjustment_exposure") static function set_exposure(ptr:Dynamic, value:Float):Float;
}

abstract ExposureAdjustment(Dynamic) {
	public var exposure(get, set):Float;

	inline function get_exposure():Float return ExposureAdjustment_Ffi.get_exposure(this);

	inline function set_exposure(value:Float):Float return ExposureAdjustment_Ffi.set_exposure(this, value);
}
