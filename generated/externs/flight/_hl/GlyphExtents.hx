package flight._hl;

abstract GlyphExtents(hl.Bytes) {
	public var height(get, set):Single;

	inline function get_height():Single return this.getF32(0);

	inline function set_height(value:Single):Single { this.setF32(0, value); return value; }
	public var width(get, set):Single;

	inline function get_width():Single return this.getF32(4);

	inline function set_width(value:Single):Single { this.setF32(4, value); return value; }
	public var xBearing(get, set):Single;

	inline function get_xBearing():Single return this.getF32(8);

	inline function set_xBearing(value:Single):Single { this.setF32(8, value); return value; }
	public var yBearing(get, set):Single;

	inline function get_yBearing():Single return this.getF32(12);

	inline function set_yBearing(value:Single):Single { this.setF32(12, value); return value; }
}
