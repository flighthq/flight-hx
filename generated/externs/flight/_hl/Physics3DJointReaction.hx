package flight._hl;

abstract Physics3DJointReaction(hl.Bytes) {
	public var forceX(get, set):Single;

	inline function get_forceX():Single return this.getF32(16);

	inline function set_forceX(value:Single):Single { this.setF32(16, value); return value; }
	public var forceY(get, set):Single;

	inline function get_forceY():Single return this.getF32(20);

	inline function set_forceY(value:Single):Single { this.setF32(20, value); return value; }
	public var forceZ(get, set):Single;

	inline function get_forceZ():Single return this.getF32(24);

	inline function set_forceZ(value:Single):Single { this.setF32(24, value); return value; }
	public var torqueX(get, set):Single;

	inline function get_torqueX():Single return this.getF32(28);

	inline function set_torqueX(value:Single):Single { this.setF32(28, value); return value; }
	public var torqueY(get, set):Single;

	inline function get_torqueY():Single return this.getF32(32);

	inline function set_torqueY(value:Single):Single { this.setF32(32, value); return value; }
	public var torqueZ(get, set):Single;

	inline function get_torqueZ():Single return this.getF32(36);

	inline function set_torqueZ(value:Single):Single { this.setF32(36, value); return value; }
}
