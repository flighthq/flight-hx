package flight._hl;

abstract Physics2DMouseJointOptions(hl.Bytes) {
	public var body(get, set):Int;

	inline function get_body():Int return this.getI32(0);

	inline function set_body(value:Int):Int { this.setI32(0, value); return value; }
	public var maxForce(get, set):Single;

	inline function get_maxForce():Single return this.getF32(52);

	inline function set_maxForce(value:Single):Single { this.setF32(52, value); return value; }
	public var targetX(get, set):Single;

	inline function get_targetX():Single return this.getF32(56);

	inline function set_targetX(value:Single):Single { this.setF32(56, value); return value; }
	public var targetY(get, set):Single;

	inline function get_targetY():Single return this.getF32(60);

	inline function set_targetY(value:Single):Single { this.setF32(60, value); return value; }
}
