package flight._hl;

abstract Physics2DPulleyJoint(hl.Bytes) {
	public var constant(get, set):Single;

	inline function get_constant():Single return this.getF32(136);

	inline function set_constant(value:Single):Single { this.setF32(136, value); return value; }
	public var groundAnchorAx(get, set):Single;

	inline function get_groundAnchorAx():Single return this.getF32(140);

	inline function set_groundAnchorAx(value:Single):Single { this.setF32(140, value); return value; }
	public var groundAnchorAy(get, set):Single;

	inline function get_groundAnchorAy():Single return this.getF32(144);

	inline function set_groundAnchorAy(value:Single):Single { this.setF32(144, value); return value; }
	public var groundAnchorBx(get, set):Single;

	inline function get_groundAnchorBx():Single return this.getF32(148);

	inline function set_groundAnchorBx(value:Single):Single { this.setF32(148, value); return value; }
	public var groundAnchorBy(get, set):Single;

	inline function get_groundAnchorBy():Single return this.getF32(152);

	inline function set_groundAnchorBy(value:Single):Single { this.setF32(152, value); return value; }
	public var ratio(get, set):Single;

	inline function get_ratio():Single return this.getF32(156);

	inline function set_ratio(value:Single):Single { this.setF32(156, value); return value; }
}
