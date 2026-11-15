package flight._hl;

abstract ToonModifierOptions(hl.Bytes) {
	public var steps(get, set):Single;

	inline function get_steps():Single return this.getF32(0);

	inline function set_steps(value:Single):Single { this.setF32(0, value); return value; }
}
