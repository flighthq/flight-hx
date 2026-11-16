package flight._js;

abstract RiveWeightedPoint(Dynamic) {
	public var vertex(get, set):Int;
	inline function get_vertex():Int return untyped this["vertex"];
	inline function set_vertex(value:Int):Int return untyped this["vertex"] = value;
	public var x(get, set):Float;
	inline function get_x():Float return untyped this["x"];
	inline function set_x(value:Float):Float return untyped this["x"] = value;
	public var y(get, set):Float;
	inline function get_y():Float return untyped this["y"];
	inline function set_y(value:Float):Float return untyped this["y"] = value;
}
