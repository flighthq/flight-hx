package flight._js;

abstract SpotLightConeAngles(Dynamic) {
	public var innerDegrees(get, set):Float;
	inline function get_innerDegrees():Float return untyped this.innerDegrees;
	inline function set_innerDegrees(value:Float):Float return untyped this.innerDegrees = value;
	public var outerDegrees(get, set):Float;
	inline function get_outerDegrees():Float return untyped this.outerDegrees;
	inline function set_outerDegrees(value:Float):Float return untyped this.outerDegrees = value;
}
