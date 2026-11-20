package flight._hl;

abstract Physics2DGearJointOptions(hl.Bytes) {
	public var constant(get, set):Float;

	inline function get_constant():Float return this.getF64(176);

	inline function set_constant(value:Float):Float { this.setF64(176, value); return value; }
}
