package flight._hl;

abstract SpringConfig(hl.Bytes) {
	public var dampingRatio(get, set):Float;

	inline function get_dampingRatio():Float return this.getF64(0);

	inline function set_dampingRatio(value:Float):Float { this.setF64(0, value); return value; }
	public var frequency(get, set):Float;

	inline function get_frequency():Float return this.getF64(8);

	inline function set_frequency(value:Float):Float { this.setF64(8, value); return value; }
}
