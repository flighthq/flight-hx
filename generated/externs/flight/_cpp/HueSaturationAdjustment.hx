package flight._cpp;

private extern class HueSaturationAdjustment_Ffi {
	@:native("flight_get_hue_saturation_adjustment_hue") static function get_hue(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_hue_saturation_adjustment_hue") static function set_hue(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_hue_saturation_adjustment_saturation") static function get_saturation(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_hue_saturation_adjustment_saturation") static function set_saturation(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_hue_saturation_adjustment_lightness") static function get_lightness(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_hue_saturation_adjustment_lightness") static function set_lightness(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract HueSaturationAdjustment(cpp.Star<cpp.Void>) {
	public var hue(get, set):Single;

	inline function get_hue():Single return HueSaturationAdjustment_Ffi.get_hue(this);

	inline function set_hue(value:Single):Single return HueSaturationAdjustment_Ffi.set_hue(this, value);
	public var saturation(get, set):Single;

	inline function get_saturation():Single return HueSaturationAdjustment_Ffi.get_saturation(this);

	inline function set_saturation(value:Single):Single return HueSaturationAdjustment_Ffi.set_saturation(this, value);
	public var lightness(get, set):Single;

	inline function get_lightness():Single return HueSaturationAdjustment_Ffi.get_lightness(this);

	inline function set_lightness(value:Single):Single return HueSaturationAdjustment_Ffi.set_lightness(this, value);
}
