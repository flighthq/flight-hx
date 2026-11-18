package flight._js;

abstract TextMetrics(Dynamic) {
	public var height(get, set):Float;
	inline function get_height():Float return untyped this["height"];
	inline function set_height(value:Float):Float return untyped this["height"] = value;
	public var numLines(get, set):Int;
	inline function get_numLines():Int return untyped this["numLines"];
	inline function set_numLines(value:Int):Int return untyped this["numLines"] = value;
	public var width(get, set):Float;
	inline function get_width():Float return untyped this["width"];
	inline function set_width(value:Float):Float return untyped this["width"] = value;
}
