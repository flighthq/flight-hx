package flight._hl;

abstract Physics3DJointReaction(hl.Bytes) {
	public var forceX(get, set):Float;

	inline function get_forceX():Float return this.getF64(16);

	inline function set_forceX(value:Float):Float { this.setF64(16, value); return value; }
	public var forceY(get, set):Float;

	inline function get_forceY():Float return this.getF64(24);

	inline function set_forceY(value:Float):Float { this.setF64(24, value); return value; }
	public var forceZ(get, set):Float;

	inline function get_forceZ():Float return this.getF64(32);

	inline function set_forceZ(value:Float):Float { this.setF64(32, value); return value; }
	public var torqueX(get, set):Float;

	inline function get_torqueX():Float return this.getF64(40);

	inline function set_torqueX(value:Float):Float { this.setF64(40, value); return value; }
	public var torqueY(get, set):Float;

	inline function get_torqueY():Float return this.getF64(48);

	inline function set_torqueY(value:Float):Float { this.setF64(48, value); return value; }
	public var torqueZ(get, set):Float;

	inline function get_torqueZ():Float return this.getF64(56);

	inline function set_torqueZ(value:Float):Float { this.setF64(56, value); return value; }
}
