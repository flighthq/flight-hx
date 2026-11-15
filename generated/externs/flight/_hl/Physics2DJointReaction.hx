package flight._hl;

abstract Physics2DJointReaction(hl.Bytes) {
	public var forceX(get, set):Single;

	inline function get_forceX():Single return this.getF32(16);

	inline function set_forceX(value:Single):Single { this.setF32(16, value); return value; }
	public var forceY(get, set):Single;

	inline function get_forceY():Single return this.getF32(20);

	inline function set_forceY(value:Single):Single { this.setF32(20, value); return value; }
	public var torque(get, set):Single;

	inline function get_torque():Single return this.getF32(24);

	inline function set_torque(value:Single):Single { this.setF32(24, value); return value; }
}
