package flight._hl;

abstract AnimatedNormalModifier(hl.Bytes) {
	public var strength(get, set):Single;

	inline function get_strength():Single return this.getF32(96);

	inline function set_strength(value:Single):Single { this.setF32(96, value); return value; }
}
