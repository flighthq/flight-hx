package flight._js;

abstract GlyphMetrics(Dynamic) {
	public var ascent(get, set):Float;
	inline function get_ascent():Float return untyped this.ascent;
	inline function set_ascent(value:Float):Float return untyped this.ascent = value;
	public var descent(get, set):Float;
	inline function get_descent():Float return untyped this.descent;
	inline function set_descent(value:Float):Float return untyped this.descent = value;
	public var lineGap(get, set):Float;
	inline function get_lineGap():Float return untyped this.lineGap;
	inline function set_lineGap(value:Float):Float return untyped this.lineGap = value;
}
