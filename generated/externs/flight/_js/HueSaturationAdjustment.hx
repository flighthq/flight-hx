package flight._js;

@:jsRequire("flight")
private extern class HueSaturationAdjustment_Ffi {
	@:native("flight_get_hue_saturation_adjustment_hue") static function get_hue(ptr:Dynamic):Float;
	@:native("flight_set_hue_saturation_adjustment_hue") static function set_hue(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_hue_saturation_adjustment_saturation") static function get_saturation(ptr:Dynamic):Float;
	@:native("flight_set_hue_saturation_adjustment_saturation") static function set_saturation(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_hue_saturation_adjustment_lightness") static function get_lightness(ptr:Dynamic):Float;
	@:native("flight_set_hue_saturation_adjustment_lightness") static function set_lightness(ptr:Dynamic, value:Float):Float;
}

abstract HueSaturationAdjustment(Dynamic) {
	public var hue(get, set):Float;

	inline function get_hue():Float return HueSaturationAdjustment_Ffi.get_hue(this);

	inline function set_hue(value:Float):Float return HueSaturationAdjustment_Ffi.set_hue(this, value);
	public var saturation(get, set):Float;

	inline function get_saturation():Float return HueSaturationAdjustment_Ffi.get_saturation(this);

	inline function set_saturation(value:Float):Float return HueSaturationAdjustment_Ffi.set_saturation(this, value);
	public var lightness(get, set):Float;

	inline function get_lightness():Float return HueSaturationAdjustment_Ffi.get_lightness(this);

	inline function set_lightness(value:Float):Float return HueSaturationAdjustment_Ffi.set_lightness(this, value);
}
