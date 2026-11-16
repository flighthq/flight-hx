package flight._js;

abstract BrightnessContrastAdjustment(Dynamic) {
	public var brightness(get, set):Float;
	inline function get_brightness():Float return untyped this["brightness"];
	inline function set_brightness(value:Float):Float return untyped this["brightness"] = value;
	public var contrast(get, set):Float;
	inline function get_contrast():Float return untyped this["contrast"];
	inline function set_contrast(value:Float):Float return untyped this["contrast"] = value;
}
