package flight._js;

abstract ToonModifier(Dynamic) {
	public var steps(get, set):Float;
	inline function get_steps():Float return untyped this.steps;
	inline function set_steps(value:Float):Float return untyped this.steps = value;
	public var smoothness(get, set):Float;
	inline function get_smoothness():Float return untyped this.smoothness;
	inline function set_smoothness(value:Float):Float return untyped this.smoothness = value;
}
