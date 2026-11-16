package flight._js;

abstract SfntGlyphBounds(Dynamic) {
	public var xMax(get, set):Float;
	inline function get_xMax():Float return untyped this["xMax"];
	inline function set_xMax(value:Float):Float return untyped this["xMax"] = value;
	public var xMin(get, set):Float;
	inline function get_xMin():Float return untyped this["xMin"];
	inline function set_xMin(value:Float):Float return untyped this["xMin"] = value;
	public var yMax(get, set):Float;
	inline function get_yMax():Float return untyped this["yMax"];
	inline function set_yMax(value:Float):Float return untyped this["yMax"] = value;
	public var yMin(get, set):Float;
	inline function get_yMin():Float return untyped this["yMin"];
	inline function set_yMin(value:Float):Float return untyped this["yMin"] = value;
}
