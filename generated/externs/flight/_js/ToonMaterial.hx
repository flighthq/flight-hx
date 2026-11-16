package flight._js;

abstract ToonMaterial(Dynamic) {
	public var baseColor(get, set):Int;
	inline function get_baseColor():Int return untyped this["baseColor"];
	inline function set_baseColor(value:Int):Int return untyped this["baseColor"] = value;
	public var steps(get, set):Int;
	inline function get_steps():Int return untyped this["steps"];
	inline function set_steps(value:Int):Int return untyped this["steps"] = value;
}
