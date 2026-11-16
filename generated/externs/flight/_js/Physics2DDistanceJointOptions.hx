package flight._js;

abstract Physics2DDistanceJointOptions(Dynamic) {
	public var length(get, set):Float;
	inline function get_length():Float return untyped this["length"];
	inline function set_length(value:Float):Float return untyped this["length"] = value;
}
