package flight._hl;

abstract Physics2DMouseJointOptions(hl.Bytes) {
	public var body(get, set):Int;

	inline function get_body():Int return this.getI32(0);

	inline function set_body(value:Int):Int { this.setI32(0, value); return value; }
	public var maxForce(get, set):Float;

	inline function get_maxForce():Float return this.getF64(104);

	inline function set_maxForce(value:Float):Float { this.setF64(104, value); return value; }
	public var targetX(get, set):Float;

	inline function get_targetX():Float return this.getF64(112);

	inline function set_targetX(value:Float):Float { this.setF64(112, value); return value; }
	public var targetY(get, set):Float;

	inline function get_targetY():Float return this.getF64(120);

	inline function set_targetY(value:Float):Float { this.setF64(120, value); return value; }
}
