package flight._js;

abstract GltfAnimationSampler(Dynamic) {
	public var input(get, set):Float;
	inline function get_input():Float return untyped this["input"];
	inline function set_input(value:Float):Float return untyped this["input"] = value;
	public var output(get, set):Float;
	inline function get_output():Float return untyped this["output"];
	inline function set_output(value:Float):Float return untyped this["output"] = value;
}
