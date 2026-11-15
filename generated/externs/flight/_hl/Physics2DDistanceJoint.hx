package flight._hl;

abstract Physics2DDistanceJoint(hl.Bytes) {
	public var dampingRatio(get, set):Single;

	inline function get_dampingRatio():Single return this.getF32(136);

	inline function set_dampingRatio(value:Single):Single { this.setF32(136, value); return value; }
	public var frequencyHz(get, set):Single;

	inline function get_frequencyHz():Single return this.getF32(140);

	inline function set_frequencyHz(value:Single):Single { this.setF32(140, value); return value; }
	public var length(get, set):Single;

	inline function get_length():Single return this.getF32(144);

	inline function set_length(value:Single):Single { this.setF32(144, value); return value; }
}
