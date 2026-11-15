package flight._js;

@:jsRequire("flight")
private extern class BrightnessContrastAdjustment_Ffi {
	@:native("flight_get_brightness_contrast_adjustment_brightness") static function get_brightness(ptr:Dynamic):Float;
	@:native("flight_set_brightness_contrast_adjustment_brightness") static function set_brightness(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_brightness_contrast_adjustment_contrast") static function get_contrast(ptr:Dynamic):Float;
	@:native("flight_set_brightness_contrast_adjustment_contrast") static function set_contrast(ptr:Dynamic, value:Float):Float;
}

abstract BrightnessContrastAdjustment(Dynamic) {
	public var brightness(get, set):Float;

	inline function get_brightness():Float return BrightnessContrastAdjustment_Ffi.get_brightness(this);

	inline function set_brightness(value:Float):Float return BrightnessContrastAdjustment_Ffi.set_brightness(this, value);
	public var contrast(get, set):Float;

	inline function get_contrast():Float return BrightnessContrastAdjustment_Ffi.get_contrast(this);

	inline function set_contrast(value:Float):Float return BrightnessContrastAdjustment_Ffi.set_contrast(this, value);
}
