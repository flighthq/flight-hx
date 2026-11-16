package flight._cpp;

private extern class ExposureAdjustment_Ffi {
	@:native("flight_get_exposure_adjustment_exposure") static function get_exposure(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_exposure_adjustment_exposure") static function set_exposure(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract ExposureAdjustment(cpp.Star<cpp.Void>) {
	public var exposure(get, set):Single;

	inline function get_exposure():Single return ExposureAdjustment_Ffi.get_exposure(this);

	inline function set_exposure(value:Single):Single { ExposureAdjustment_Ffi.set_exposure(this, value); return value; }
}
