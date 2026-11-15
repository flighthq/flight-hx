package flight._hl;

abstract SpringConfig(hl.Bytes) {
	public var dampingRatio(get, set):Single;

	inline function get_dampingRatio():Single return this.getF32(0);

	inline function set_dampingRatio(value:Single):Single { this.setF32(0, value); return value; }
	public var frequency(get, set):Single;

	inline function get_frequency():Single return this.getF32(4);

	inline function set_frequency(value:Single):Single { this.setF32(4, value); return value; }
}
