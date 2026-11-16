package flight._js;

abstract Md5Vertex(Dynamic) {
	public var countWeights(get, set):Int;
	inline function get_countWeights():Int return untyped this["countWeights"];
	inline function set_countWeights(value:Int):Int return untyped this["countWeights"] = value;
	public var startWeight(get, set):Int;
	inline function get_startWeight():Int return untyped this["startWeight"];
	inline function set_startWeight(value:Int):Int return untyped this["startWeight"] = value;
	public var u(get, set):Float;
	inline function get_u():Float return untyped this["u"];
	inline function set_u(value:Float):Float return untyped this["u"] = value;
	public var v(get, set):Float;
	inline function get_v():Float return untyped this["v"];
	inline function set_v(value:Float):Float return untyped this["v"] = value;
}
