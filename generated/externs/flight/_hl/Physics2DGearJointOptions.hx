package flight._hl;

abstract Physics2DGearJointOptions(hl.Bytes) {
	public var constant(get, set):Single;

	inline function get_constant():Single return this.getF32(92);

	inline function set_constant(value:Single):Single { this.setF32(92, value); return value; }
}
