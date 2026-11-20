package flight._hl;

abstract FontMetrics(hl.Bytes) {
	public var ascent(get, set):Single;

	inline function get_ascent():Single return this.getF32(0);

	inline function set_ascent(value:Single):Single { this.setF32(0, value); return value; }
	public var capHeight(get, set):Single;

	inline function get_capHeight():Single return this.getF32(4);

	inline function set_capHeight(value:Single):Single { this.setF32(4, value); return value; }
	public var descent(get, set):Single;

	inline function get_descent():Single return this.getF32(8);

	inline function set_descent(value:Single):Single { this.setF32(8, value); return value; }
	public var lineGap(get, set):Single;

	inline function get_lineGap():Single return this.getF32(12);

	inline function set_lineGap(value:Single):Single { this.setF32(12, value); return value; }
	public var underlinePosition(get, set):Single;

	inline function get_underlinePosition():Single return this.getF32(16);

	inline function set_underlinePosition(value:Single):Single { this.setF32(16, value); return value; }
	public var underlineThickness(get, set):Single;

	inline function get_underlineThickness():Single return this.getF32(20);

	inline function set_underlineThickness(value:Single):Single { this.setF32(20, value); return value; }
	public var unitsPerEm(get, set):Single;

	inline function get_unitsPerEm():Single return this.getF32(24);

	inline function set_unitsPerEm(value:Single):Single { this.setF32(24, value); return value; }
	public var xHeight(get, set):Single;

	inline function get_xHeight():Single return this.getF32(28);

	inline function set_xHeight(value:Single):Single { this.setF32(28, value); return value; }
}
