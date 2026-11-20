package flight._hl;

abstract Physics3DContactConstraintPoint(hl.Bytes) {
	public var featureId(get, set):haxe.Int64;

	inline function get_featureId():haxe.Int64 return haxe.Int64.make(this.getI32(20), this.getI32(16));

	inline function set_featureId(value:haxe.Int64):haxe.Int64 { { this.setI32(16, value.low); this.setI32(20, value.high); }; return value; }
	public var normalImpulse(get, set):Float;

	inline function get_normalImpulse():Float return this.getF64(24);

	inline function set_normalImpulse(value:Float):Float { this.setF64(24, value); return value; }
	public var tangentImpulse0(get, set):Float;

	inline function get_tangentImpulse0():Float return this.getF64(32);

	inline function set_tangentImpulse0(value:Float):Float { this.setF64(32, value); return value; }
	public var tangentImpulse1(get, set):Float;

	inline function get_tangentImpulse1():Float return this.getF64(40);

	inline function set_tangentImpulse1(value:Float):Float { this.setF64(40, value); return value; }
	public var normalMass(get, set):Float;

	inline function get_normalMass():Float return this.getF64(48);

	inline function set_normalMass(value:Float):Float { this.setF64(48, value); return value; }
	public var tangentMass0(get, set):Float;

	inline function get_tangentMass0():Float return this.getF64(56);

	inline function set_tangentMass0(value:Float):Float { this.setF64(56, value); return value; }
	public var tangentMass1(get, set):Float;

	inline function get_tangentMass1():Float return this.getF64(64);

	inline function set_tangentMass1(value:Float):Float { this.setF64(64, value); return value; }
	public var bias(get, set):Float;

	inline function get_bias():Float return this.getF64(72);

	inline function set_bias(value:Float):Float { this.setF64(72, value); return value; }
}
