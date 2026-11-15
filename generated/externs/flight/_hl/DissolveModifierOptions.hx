package flight._hl;

abstract DissolveModifierOptions(hl.Bytes) {
	public var threshold(get, set):Single;

	inline function get_threshold():Single return this.getF32(0);

	inline function set_threshold(value:Single):Single { this.setF32(0, value); return value; }
}
