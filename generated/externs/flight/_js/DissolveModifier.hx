package flight._js;

abstract DissolveModifier(Dynamic) {
	public var threshold(get, set):Float;
	inline function get_threshold():Float return untyped this["threshold"];
	inline function set_threshold(value:Float):Float return untyped this["threshold"] = value;
	public var edgeColor(get, set):Int;
	inline function get_edgeColor():Int return untyped this["edgeColor"];
	inline function set_edgeColor(value:Int):Int return untyped this["edgeColor"] = value;
	public var edgeWidth(get, set):Float;
	inline function get_edgeWidth():Float return untyped this["edgeWidth"];
	inline function set_edgeWidth(value:Float):Float return untyped this["edgeWidth"] = value;
	public var scale(get, set):Float;
	inline function get_scale():Float return untyped this["scale"];
	inline function set_scale(value:Float):Float return untyped this["scale"] = value;
}
