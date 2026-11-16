package flight._js;

abstract ToonModifierOptions(Dynamic) {
	public var steps(get, set):Float;
	inline function get_steps():Float return untyped this["steps"];
	inline function set_steps(value:Float):Float return untyped this["steps"] = value;
}
