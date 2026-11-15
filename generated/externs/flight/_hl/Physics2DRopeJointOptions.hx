package flight._hl;

abstract Physics2DRopeJointOptions(hl.Bytes) {
	public var maxLength(get, set):Single;

	inline function get_maxLength():Single return this.getF32(60);

	inline function set_maxLength(value:Single):Single { this.setF32(60, value); return value; }
}
