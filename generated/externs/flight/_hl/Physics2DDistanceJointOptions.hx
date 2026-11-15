package flight._hl;

abstract Physics2DDistanceJointOptions(hl.Bytes) {
	public var length(get, set):Single;

	inline function get_length():Single return this.getF32(76);

	inline function set_length(value:Single):Single { this.setF32(76, value); return value; }
}
