package flight._js;

abstract Physics2DGearJointOptions(Dynamic) {
	public var constant(get, set):Float;
	inline function get_constant():Float return untyped this["constant"];
	inline function set_constant(value:Float):Float return untyped this["constant"] = value;
}
