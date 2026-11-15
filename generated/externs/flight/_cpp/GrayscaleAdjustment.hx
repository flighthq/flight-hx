package flight._cpp;

private extern class GrayscaleAdjustment_Ffi {
	@:native("flight_get_grayscale_adjustment_intensity") static function get_intensity(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_grayscale_adjustment_intensity") static function set_intensity(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract GrayscaleAdjustment(cpp.Star<cpp.Void>) {
	public var intensity(get, set):Single;

	inline function get_intensity():Single return GrayscaleAdjustment_Ffi.get_intensity(this);

	inline function set_intensity(value:Single):Single return GrayscaleAdjustment_Ffi.set_intensity(this, value);
}
