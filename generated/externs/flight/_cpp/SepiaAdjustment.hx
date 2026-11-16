package flight._cpp;

private extern class SepiaAdjustment_Ffi {
	@:native("flight_get_sepia_adjustment_intensity") static function get_intensity(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_sepia_adjustment_intensity") static function set_intensity(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract SepiaAdjustment(cpp.Star<cpp.Void>) {
	public var intensity(get, set):Single;

	inline function get_intensity():Single return SepiaAdjustment_Ffi.get_intensity(this);

	inline function set_intensity(value:Single):Single { SepiaAdjustment_Ffi.set_intensity(this, value); return value; }
}
