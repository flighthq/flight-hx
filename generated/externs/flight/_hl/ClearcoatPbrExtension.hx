package flight._hl;

abstract ClearcoatPbrExtension(hl.Bytes) {
	public var clearcoat(get, set):Single;

	inline function get_clearcoat():Single return this.getF32(64);

	inline function set_clearcoat(value:Single):Single { this.setF32(64, value); return value; }
	public var clearcoatNormalScale(get, set):Single;

	inline function get_clearcoatNormalScale():Single return this.getF32(76);

	inline function set_clearcoatNormalScale(value:Single):Single { this.setF32(76, value); return value; }
	public var clearcoatRoughness(get, set):Single;

	inline function get_clearcoatRoughness():Single return this.getF32(80);

	inline function set_clearcoatRoughness(value:Single):Single { this.setF32(80, value); return value; }
}
