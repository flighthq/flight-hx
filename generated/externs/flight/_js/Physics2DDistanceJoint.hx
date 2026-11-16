package flight._js;

abstract Physics2DDistanceJoint(Dynamic) {
	public var dampingRatio(get, set):Float;
	inline function get_dampingRatio():Float return untyped this["dampingRatio"];
	inline function set_dampingRatio(value:Float):Float return untyped this["dampingRatio"] = value;
	public var frequencyHz(get, set):Float;
	inline function get_frequencyHz():Float return untyped this["frequencyHz"];
	inline function set_frequencyHz(value:Float):Float return untyped this["frequencyHz"] = value;
	public var length(get, set):Float;
	inline function get_length():Float return untyped this["length"];
	inline function set_length(value:Float):Float return untyped this["length"] = value;
}
