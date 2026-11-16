package flight._js;

abstract LinearColor(Dynamic) {
	public var r(get, set):Float;
	inline function get_r():Float return untyped this["r"];
	inline function set_r(value:Float):Float return untyped this["r"] = value;
	public var g(get, set):Float;
	inline function get_g():Float return untyped this["g"];
	inline function set_g(value:Float):Float return untyped this["g"] = value;
	public var b(get, set):Float;
	inline function get_b():Float return untyped this["b"];
	inline function set_b(value:Float):Float return untyped this["b"] = value;
	public var a(get, set):Float;
	inline function get_a():Float return untyped this["a"];
	inline function set_a(value:Float):Float return untyped this["a"] = value;
}
