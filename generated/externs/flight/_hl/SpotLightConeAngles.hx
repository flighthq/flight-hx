package flight._hl;

abstract SpotLightConeAngles(hl.Bytes) {
	public var innerDegrees(get, set):Float;

	inline function get_innerDegrees():Float return this.getF64(0);

	inline function set_innerDegrees(value:Float):Float { this.setF64(0, value); return value; }
	public var outerDegrees(get, set):Float;

	inline function get_outerDegrees():Float return this.getF64(8);

	inline function set_outerDegrees(value:Float):Float { this.setF64(8, value); return value; }
}
