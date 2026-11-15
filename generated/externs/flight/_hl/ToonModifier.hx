package flight._hl;

abstract ToonModifier(hl.Bytes) {
	public var steps(get, set):Single;

	inline function get_steps():Single return this.getF32(64);

	inline function set_steps(value:Single):Single { this.setF32(64, value); return value; }
	public var smoothness(get, set):Single;

	inline function get_smoothness():Single return this.getF32(68);

	inline function set_smoothness(value:Single):Single { this.setF32(68, value); return value; }
}
