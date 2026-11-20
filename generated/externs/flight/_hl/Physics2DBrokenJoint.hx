package flight._hl;

abstract Physics2DBrokenJoint(hl.Bytes) {
	public var forceX(get, set):Float;

	inline function get_forceX():Float return this.getF64(0);

	inline function set_forceX(value:Float):Float { this.setF64(0, value); return value; }
	public var forceY(get, set):Float;

	inline function get_forceY():Float return this.getF64(8);

	inline function set_forceY(value:Float):Float { this.setF64(8, value); return value; }
	public var torque(get, set):Float;

	inline function get_torque():Float return this.getF64(32);

	inline function set_torque(value:Float):Float { this.setF64(32, value); return value; }
}
