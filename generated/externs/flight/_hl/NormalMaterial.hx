package flight._hl;

abstract NormalMaterial(hl.Bytes) {
	public var normalScale(get, set):Single;

	inline function get_normalScale():Single return this.getF32(112);

	inline function set_normalScale(value:Single):Single { this.setF32(112, value); return value; }
}
