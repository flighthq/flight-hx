package flight._js;

abstract FontMetrics(Dynamic) {
	public var ascent(get, set):Float;
	inline function get_ascent():Float return untyped this.ascent;
	inline function set_ascent(value:Float):Float return untyped this.ascent = value;
	public var capHeight(get, set):Float;
	inline function get_capHeight():Float return untyped this.capHeight;
	inline function set_capHeight(value:Float):Float return untyped this.capHeight = value;
	public var descent(get, set):Float;
	inline function get_descent():Float return untyped this.descent;
	inline function set_descent(value:Float):Float return untyped this.descent = value;
	public var lineGap(get, set):Float;
	inline function get_lineGap():Float return untyped this.lineGap;
	inline function set_lineGap(value:Float):Float return untyped this.lineGap = value;
	public var underlinePosition(get, set):Float;
	inline function get_underlinePosition():Float return untyped this.underlinePosition;
	inline function set_underlinePosition(value:Float):Float return untyped this.underlinePosition = value;
	public var underlineThickness(get, set):Float;
	inline function get_underlineThickness():Float return untyped this.underlineThickness;
	inline function set_underlineThickness(value:Float):Float return untyped this.underlineThickness = value;
	public var unitsPerEm(get, set):Float;
	inline function get_unitsPerEm():Float return untyped this.unitsPerEm;
	inline function set_unitsPerEm(value:Float):Float return untyped this.unitsPerEm = value;
	public var xHeight(get, set):Float;
	inline function get_xHeight():Float return untyped this.xHeight;
	inline function set_xHeight(value:Float):Float return untyped this.xHeight = value;
}
