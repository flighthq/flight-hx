package flight._hl;

abstract BitmapFontRecord(hl.Bytes) {
	public var base(get, set):Single;

	inline function get_base():Single return this.getF32(76);

	inline function set_base(value:Single):Single { this.setF32(76, value); return value; }
	public var lineHeight(get, set):Single;

	inline function get_lineHeight():Single return this.getF32(80);

	inline function set_lineHeight(value:Single):Single { this.setF32(80, value); return value; }
}
