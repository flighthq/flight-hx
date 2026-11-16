package flight._hl;

abstract IridescencePbrExtension(hl.Bytes) {
	public var iridescence(get, set):Single;

	inline function get_iridescence():Single return this.getF32(56);

	inline function set_iridescence(value:Single):Single { this.setF32(56, value); return value; }
	public var iridescenceIor(get, set):Single;

	inline function get_iridescenceIor():Single return this.getF32(60);

	inline function set_iridescenceIor(value:Single):Single { this.setF32(60, value); return value; }
	public var iridescenceThicknessMax(get, set):Single;

	inline function get_iridescenceThicknessMax():Single return this.getF32(72);

	inline function set_iridescenceThicknessMax(value:Single):Single { this.setF32(72, value); return value; }
	public var iridescenceThicknessMin(get, set):Single;

	inline function get_iridescenceThicknessMin():Single return this.getF32(76);

	inline function set_iridescenceThicknessMin(value:Single):Single { this.setF32(76, value); return value; }
}
