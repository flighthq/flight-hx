package flight._hl;

abstract VertexDisplaceModifier(hl.Bytes) {
	public var amplitude(get, set):Single;

	inline function get_amplitude():Single return this.getF32(68);

	inline function set_amplitude(value:Single):Single { this.setF32(68, value); return value; }
	public var frequency(get, set):Single;

	inline function get_frequency():Single return this.getF32(120);

	inline function set_frequency(value:Single):Single { this.setF32(120, value); return value; }
	public var speed(get, set):Single;

	inline function get_speed():Single return this.getF32(124);

	inline function set_speed(value:Single):Single { this.setF32(124, value); return value; }
}
