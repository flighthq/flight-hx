package flight._hl;

abstract Physics3DContactConstraintPoint(hl.Bytes) {
	public var featureId(get, set):haxe.Int64;

	inline function get_featureId():haxe.Int64 return haxe.Int64.make(this.getI32(20), this.getI32(16));

	inline function set_featureId(value:haxe.Int64):haxe.Int64 { { this.setI32(16, value.low); this.setI32(20, value.high); }; return value; }
	public var normalImpulse(get, set):Single;

	inline function get_normalImpulse():Single return this.getF32(24);

	inline function set_normalImpulse(value:Single):Single { this.setF32(24, value); return value; }
	public var tangentImpulse0(get, set):Single;

	inline function get_tangentImpulse0():Single return this.getF32(28);

	inline function set_tangentImpulse0(value:Single):Single { this.setF32(28, value); return value; }
	public var tangentImpulse1(get, set):Single;

	inline function get_tangentImpulse1():Single return this.getF32(32);

	inline function set_tangentImpulse1(value:Single):Single { this.setF32(32, value); return value; }
	public var normalMass(get, set):Single;

	inline function get_normalMass():Single return this.getF32(36);

	inline function set_normalMass(value:Single):Single { this.setF32(36, value); return value; }
	public var tangentMass0(get, set):Single;

	inline function get_tangentMass0():Single return this.getF32(40);

	inline function set_tangentMass0(value:Single):Single { this.setF32(40, value); return value; }
	public var tangentMass1(get, set):Single;

	inline function get_tangentMass1():Single return this.getF32(44);

	inline function set_tangentMass1(value:Single):Single { this.setF32(44, value); return value; }
	public var bias(get, set):Single;

	inline function get_bias():Single return this.getF32(48);

	inline function set_bias(value:Single):Single { this.setF32(48, value); return value; }
}
