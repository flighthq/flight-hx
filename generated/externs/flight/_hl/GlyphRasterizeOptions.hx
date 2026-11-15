package flight._hl;

abstract GlyphRasterizeOptions(hl.Bytes) {
	public var fontSize(get, set):Single;

	inline function get_fontSize():Single return this.getF32(24);

	inline function set_fontSize(value:Single):Single { this.setF32(24, value); return value; }
}
