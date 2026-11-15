package flight._hl;

abstract GlyphRasterizeFontWeightNumber(hl.Bytes) {
	public var value(get, set):Single;

	inline function get_value():Single return this.getF32(0);

	inline function set_value(value:Single):Single { this.setF32(0, value); return value; }
}
