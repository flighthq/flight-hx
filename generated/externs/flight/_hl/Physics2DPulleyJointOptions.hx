package flight._hl;

abstract Physics2DPulleyJointOptions(hl.Bytes) {
	public var constant(get, set):Float;

	inline function get_constant():Float return this.getF64(112);

	inline function set_constant(value:Float):Float { this.setF64(112, value); return value; }
	public var groundAnchorAx(get, set):Float;

	inline function get_groundAnchorAx():Float return this.getF64(120);

	inline function set_groundAnchorAx(value:Float):Float { this.setF64(120, value); return value; }
	public var groundAnchorAy(get, set):Float;

	inline function get_groundAnchorAy():Float return this.getF64(128);

	inline function set_groundAnchorAy(value:Float):Float { this.setF64(128, value); return value; }
	public var groundAnchorBx(get, set):Float;

	inline function get_groundAnchorBx():Float return this.getF64(136);

	inline function set_groundAnchorBx(value:Float):Float { this.setF64(136, value); return value; }
	public var groundAnchorBy(get, set):Float;

	inline function get_groundAnchorBy():Float return this.getF64(144);

	inline function set_groundAnchorBy(value:Float):Float { this.setF64(144, value); return value; }
}
