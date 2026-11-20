package flight._js;

abstract Physics3DContactConstraintPoint(Dynamic) {
	public var featureId(get, set):Float;
	inline function get_featureId():Float return untyped this.featureId;
	inline function set_featureId(value:Float):Float return untyped this.featureId = value;
	public var normalImpulse(get, set):Float;
	inline function get_normalImpulse():Float return untyped this.normalImpulse;
	inline function set_normalImpulse(value:Float):Float return untyped this.normalImpulse = value;
	public var tangentImpulse0(get, set):Float;
	inline function get_tangentImpulse0():Float return untyped this.tangentImpulse0;
	inline function set_tangentImpulse0(value:Float):Float return untyped this.tangentImpulse0 = value;
	public var tangentImpulse1(get, set):Float;
	inline function get_tangentImpulse1():Float return untyped this.tangentImpulse1;
	inline function set_tangentImpulse1(value:Float):Float return untyped this.tangentImpulse1 = value;
	public var normalMass(get, set):Float;
	inline function get_normalMass():Float return untyped this.normalMass;
	inline function set_normalMass(value:Float):Float return untyped this.normalMass = value;
	public var tangentMass0(get, set):Float;
	inline function get_tangentMass0():Float return untyped this.tangentMass0;
	inline function set_tangentMass0(value:Float):Float return untyped this.tangentMass0 = value;
	public var tangentMass1(get, set):Float;
	inline function get_tangentMass1():Float return untyped this.tangentMass1;
	inline function set_tangentMass1(value:Float):Float return untyped this.tangentMass1 = value;
	public var bias(get, set):Float;
	inline function get_bias():Float return untyped this.bias;
	inline function set_bias(value:Float):Float return untyped this.bias = value;
}
