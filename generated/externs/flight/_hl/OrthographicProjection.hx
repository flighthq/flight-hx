package flight._hl;

abstract OrthographicProjection(hl.Bytes) {
	public var halfHeight(get, set):Single;

	inline function get_halfHeight():Single return this.getF32(16);

	inline function set_halfHeight(value:Single):Single { this.setF32(16, value); return value; }
	public var halfWidth(get, set):Single;

	inline function get_halfWidth():Single return this.getF32(20);

	inline function set_halfWidth(value:Single):Single { this.setF32(20, value); return value; }
}
