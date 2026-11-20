package flight._js;

abstract GlyphExtents(Dynamic) {
	public var height(get, set):Float;
	inline function get_height():Float return untyped this.height;
	inline function set_height(value:Float):Float return untyped this.height = value;
	public var width(get, set):Float;
	inline function get_width():Float return untyped this.width;
	inline function set_width(value:Float):Float return untyped this.width = value;
	public var xBearing(get, set):Float;
	inline function get_xBearing():Float return untyped this.xBearing;
	inline function set_xBearing(value:Float):Float return untyped this.xBearing = value;
	public var yBearing(get, set):Float;
	inline function get_yBearing():Float return untyped this.yBearing;
	inline function set_yBearing(value:Float):Float return untyped this.yBearing = value;
}
