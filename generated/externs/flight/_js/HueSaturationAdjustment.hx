package flight._js;

abstract HueSaturationAdjustment(Dynamic) {
	public var hue(get, set):Float;
	inline function get_hue():Float return untyped this["hue"];
	inline function set_hue(value:Float):Float return untyped this["hue"] = value;
	public var saturation(get, set):Float;
	inline function get_saturation():Float return untyped this["saturation"];
	inline function set_saturation(value:Float):Float return untyped this["saturation"] = value;
	public var lightness(get, set):Float;
	inline function get_lightness():Float return untyped this["lightness"];
	inline function set_lightness(value:Float):Float return untyped this["lightness"] = value;
}
