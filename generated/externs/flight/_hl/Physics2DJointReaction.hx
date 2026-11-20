package flight._hl;

abstract Physics2DJointReaction(hl.Bytes) {
	public var forceX(get, set):Float;

	inline function get_forceX():Float return this.getF64(16);

	inline function set_forceX(value:Float):Float { this.setF64(16, value); return value; }
	public var forceY(get, set):Float;

	inline function get_forceY():Float return this.getF64(24);

	inline function set_forceY(value:Float):Float { this.setF64(24, value); return value; }
	public var torque(get, set):Float;

	inline function get_torque():Float return this.getF64(32);

	inline function set_torque(value:Float):Float { this.setF64(32, value); return value; }
}
