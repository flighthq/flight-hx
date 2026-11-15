package flight._hl;

abstract Physics2DRopeJoint(hl.Bytes) {
	public var maxLength(get, set):Single;

	inline function get_maxLength():Single return this.getF32(136);

	inline function set_maxLength(value:Single):Single { this.setF32(136, value); return value; }
}
