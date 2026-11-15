package flight._hl;

abstract SpotLightConeAngles(hl.Bytes) {
	public var innerDegrees(get, set):Single;

	inline function get_innerDegrees():Single return this.getF32(0);

	inline function set_innerDegrees(value:Single):Single { this.setF32(0, value); return value; }
	public var outerDegrees(get, set):Single;

	inline function get_outerDegrees():Single return this.getF32(4);

	inline function set_outerDegrees(value:Single):Single { this.setF32(4, value); return value; }
}
