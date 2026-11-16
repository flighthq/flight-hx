package flight._cpp;

private extern class InvertAdjustment_Ffi {
	@:native("flight_get_invert_adjustment_intensity") static function get_intensity(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_invert_adjustment_intensity") static function set_intensity(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract InvertAdjustment(cpp.Star<cpp.Void>) {
	public var intensity(get, set):Single;

	inline function get_intensity():Single return InvertAdjustment_Ffi.get_intensity(this);

	inline function set_intensity(value:Single):Single { InvertAdjustment_Ffi.set_intensity(this, value); return value; }
}
