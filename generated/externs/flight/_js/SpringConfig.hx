package flight._js;

abstract SpringConfig(Dynamic) {
	public var dampingRatio(get, set):Float;
	inline function get_dampingRatio():Float return untyped this.dampingRatio;
	inline function set_dampingRatio(value:Float):Float return untyped this.dampingRatio = value;
	public var frequency(get, set):Float;
	inline function get_frequency():Float return untyped this.frequency;
	inline function set_frequency(value:Float):Float return untyped this.frequency = value;
}
