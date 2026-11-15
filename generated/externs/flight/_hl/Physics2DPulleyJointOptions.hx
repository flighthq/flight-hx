package flight._hl;

abstract Physics2DPulleyJointOptions(hl.Bytes) {
	public var constant(get, set):Single;

	inline function get_constant():Single return this.getF32(60);

	inline function set_constant(value:Single):Single { this.setF32(60, value); return value; }
	public var groundAnchorAx(get, set):Single;

	inline function get_groundAnchorAx():Single return this.getF32(64);

	inline function set_groundAnchorAx(value:Single):Single { this.setF32(64, value); return value; }
	public var groundAnchorAy(get, set):Single;

	inline function get_groundAnchorAy():Single return this.getF32(68);

	inline function set_groundAnchorAy(value:Single):Single { this.setF32(68, value); return value; }
	public var groundAnchorBx(get, set):Single;

	inline function get_groundAnchorBx():Single return this.getF32(72);

	inline function set_groundAnchorBx(value:Single):Single { this.setF32(72, value); return value; }
	public var groundAnchorBy(get, set):Single;

	inline function get_groundAnchorBy():Single return this.getF32(76);

	inline function set_groundAnchorBy(value:Single):Single { this.setF32(76, value); return value; }
}
