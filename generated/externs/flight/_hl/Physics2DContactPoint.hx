package flight._hl;

abstract Physics2DContactPoint(hl.Bytes) {
	public var bias(get, set):Float;

	inline function get_bias():Float return this.getF64(0);

	inline function set_bias(value:Float):Float { this.setF64(0, value); return value; }
	public var depth(get, set):Float;

	inline function get_depth():Float return this.getF64(8);

	inline function set_depth(value:Float):Float { this.setF64(8, value); return value; }
	public var featureId(get, set):haxe.Int64;

	inline function get_featureId():haxe.Int64 return haxe.Int64.make(this.getI32(20), this.getI32(16));

	inline function set_featureId(value:haxe.Int64):haxe.Int64 { { this.setI32(16, value.low); this.setI32(20, value.high); }; return value; }
	public var normalImpulse(get, set):Float;

	inline function get_normalImpulse():Float return this.getF64(24);

	inline function set_normalImpulse(value:Float):Float { this.setF64(24, value); return value; }
	public var normalMass(get, set):Float;

	inline function get_normalMass():Float return this.getF64(32);

	inline function set_normalMass(value:Float):Float { this.setF64(32, value); return value; }
	public var rAx(get, set):Float;

	inline function get_rAx():Float return this.getF64(40);

	inline function set_rAx(value:Float):Float { this.setF64(40, value); return value; }
	public var rAy(get, set):Float;

	inline function get_rAy():Float return this.getF64(48);

	inline function set_rAy(value:Float):Float { this.setF64(48, value); return value; }
	public var rBx(get, set):Float;

	inline function get_rBx():Float return this.getF64(56);

	inline function set_rBx(value:Float):Float { this.setF64(56, value); return value; }
	public var rBy(get, set):Float;

	inline function get_rBy():Float return this.getF64(64);

	inline function set_rBy(value:Float):Float { this.setF64(64, value); return value; }
	public var tangentImpulse(get, set):Float;

	inline function get_tangentImpulse():Float return this.getF64(72);

	inline function set_tangentImpulse(value:Float):Float { this.setF64(72, value); return value; }
	public var tangentMass(get, set):Float;

	inline function get_tangentMass():Float return this.getF64(80);

	inline function set_tangentMass(value:Float):Float { this.setF64(80, value); return value; }
	public var x(get, set):Float;

	inline function get_x():Float return this.getF64(88);

	inline function set_x(value:Float):Float { this.setF64(88, value); return value; }
	public var y(get, set):Float;

	inline function get_y():Float return this.getF64(96);

	inline function set_y(value:Float):Float { this.setF64(96, value); return value; }
}
