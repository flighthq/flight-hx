package flight._hl;

abstract GlyphMetrics(hl.Bytes) {
	public var ascent(get, set):Single;

	inline function get_ascent():Single return this.getF32(0);

	inline function set_ascent(value:Single):Single { this.setF32(0, value); return value; }
	public var descent(get, set):Single;

	inline function get_descent():Single return this.getF32(4);

	inline function set_descent(value:Single):Single { this.setF32(4, value); return value; }
	public var lineGap(get, set):Single;

	inline function get_lineGap():Single return this.getF32(8);

	inline function set_lineGap(value:Single):Single { this.setF32(8, value); return value; }
}
