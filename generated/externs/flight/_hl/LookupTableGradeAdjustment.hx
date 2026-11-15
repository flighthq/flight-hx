package flight._hl;

abstract LookupTableGradeAdjustment(hl.Bytes) {
	public var strength(get, set):Single;

	inline function get_strength():Single return this.getF32(176);

	inline function set_strength(value:Single):Single { this.setF32(176, value); return value; }
}
