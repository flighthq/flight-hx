package flight._hl;

abstract Physics2DBrokenJoint(hl.Bytes) {
	public var forceX(get, set):Single;

	inline function get_forceX():Single return this.getF32(0);

	inline function set_forceX(value:Single):Single { this.setF32(0, value); return value; }
	public var forceY(get, set):Single;

	inline function get_forceY():Single return this.getF32(4);

	inline function set_forceY(value:Single):Single { this.setF32(4, value); return value; }
	public var torque(get, set):Single;

	inline function get_torque():Single return this.getF32(24);

	inline function set_torque(value:Single):Single { this.setF32(24, value); return value; }
}
