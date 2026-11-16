package flight._js;

abstract AnimatedNormalModifier(Dynamic) {
	public var strength(get, set):Float;
	inline function get_strength():Float return untyped this["strength"];
	inline function set_strength(value:Float):Float return untyped this["strength"] = value;
}
