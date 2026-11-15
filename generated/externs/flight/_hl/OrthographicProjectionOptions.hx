package flight._hl;

abstract OrthographicProjectionOptions(hl.Bytes) {
	public var halfHeight(get, set):Single;

	inline function get_halfHeight():Single return this.getF32(0);

	inline function set_halfHeight(value:Single):Single { this.setF32(0, value); return value; }
	public var halfWidth(get, set):Single;

	inline function get_halfWidth():Single return this.getF32(4);

	inline function set_halfWidth(value:Single):Single { this.setF32(4, value); return value; }
}
