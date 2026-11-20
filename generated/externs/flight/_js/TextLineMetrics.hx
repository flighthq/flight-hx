package flight._js;

abstract TextLineMetrics(Dynamic) {
	public var ascent(get, set):Float;
	inline function get_ascent():Float return untyped this.ascent;
	inline function set_ascent(value:Float):Float return untyped this.ascent = value;
	public var descent(get, set):Float;
	inline function get_descent():Float return untyped this.descent;
	inline function set_descent(value:Float):Float return untyped this.descent = value;
	public var height(get, set):Float;
	inline function get_height():Float return untyped this.height;
	inline function set_height(value:Float):Float return untyped this.height = value;
	public var leading(get, set):Float;
	inline function get_leading():Float return untyped this.leading;
	inline function set_leading(value:Float):Float return untyped this.leading = value;
	public var width(get, set):Float;
	inline function get_width():Float return untyped this.width;
	inline function set_width(value:Float):Float return untyped this.width = value;
	public var x(get, set):Float;
	inline function get_x():Float return untyped this.x;
	inline function set_x(value:Float):Float return untyped this.x = value;
}
