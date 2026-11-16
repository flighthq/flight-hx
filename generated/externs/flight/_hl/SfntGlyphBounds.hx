package flight._hl;

abstract SfntGlyphBounds(hl.Bytes) {
	public var xMax(get, set):Single;

	inline function get_xMax():Single return this.getF32(0);

	inline function set_xMax(value:Single):Single { this.setF32(0, value); return value; }
	public var xMin(get, set):Single;

	inline function get_xMin():Single return this.getF32(4);

	inline function set_xMin(value:Single):Single { this.setF32(4, value); return value; }
	public var yMax(get, set):Single;

	inline function get_yMax():Single return this.getF32(8);

	inline function set_yMax(value:Single):Single { this.setF32(8, value); return value; }
	public var yMin(get, set):Single;

	inline function get_yMin():Single return this.getF32(12);

	inline function set_yMin(value:Single):Single { this.setF32(12, value); return value; }
}
