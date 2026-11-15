package flight._hl;

abstract VertexDisplaceModifierOptions(hl.Bytes) {
	public var amplitude(get, set):Single;

	inline function get_amplitude():Single return this.getF32(4);

	inline function set_amplitude(value:Single):Single { this.setF32(4, value); return value; }
}
