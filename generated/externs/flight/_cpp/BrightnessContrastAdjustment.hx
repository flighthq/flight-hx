package flight._cpp;

private extern class BrightnessContrastAdjustment_Ffi {
	@:native("flight_get_brightness_contrast_adjustment_brightness") static function get_brightness(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_brightness_contrast_adjustment_brightness") static function set_brightness(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_brightness_contrast_adjustment_contrast") static function get_contrast(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_brightness_contrast_adjustment_contrast") static function set_contrast(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract BrightnessContrastAdjustment(cpp.Star<cpp.Void>) {
	public var brightness(get, set):Single;

	inline function get_brightness():Single return BrightnessContrastAdjustment_Ffi.get_brightness(this);

	inline function set_brightness(value:Single):Single { BrightnessContrastAdjustment_Ffi.set_brightness(this, value); return value; }
	public var contrast(get, set):Single;

	inline function get_contrast():Single return BrightnessContrastAdjustment_Ffi.get_contrast(this);

	inline function set_contrast(value:Single):Single { BrightnessContrastAdjustment_Ffi.set_contrast(this, value); return value; }
}
