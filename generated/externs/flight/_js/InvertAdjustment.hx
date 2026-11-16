package flight._js;

abstract InvertAdjustment(Dynamic) {
	public var intensity(get, set):Float;
	inline function get_intensity():Float return untyped this["intensity"];
	inline function set_intensity(value:Float):Float return untyped this["intensity"] = value;
}
