package flight._hl;

abstract Physics3DConeTwistJoint(hl.Bytes) {
	public var enableSwingLimit(get, set):Bool;

	inline function get_enableSwingLimit():Bool return this.getUI8(236) != 0;

	inline function set_enableSwingLimit(value:Bool):Bool { this.setUI8(236, value ? 1 : 0); return value; }
	public var swingLimitY(get, set):Single;

	inline function get_swingLimitY():Single return this.getF32(200);

	inline function set_swingLimitY(value:Single):Single { this.setF32(200, value); return value; }
	public var swingLimitZ(get, set):Single;

	inline function get_swingLimitZ():Single return this.getF32(204);

	inline function set_swingLimitZ(value:Single):Single { this.setF32(204, value); return value; }
	public var enableTwistLimit(get, set):Bool;

	inline function get_enableTwistLimit():Bool return this.getUI8(237) != 0;

	inline function set_enableTwistLimit(value:Bool):Bool { this.setUI8(237, value ? 1 : 0); return value; }
	public var lowerTwistAngle(get, set):Single;

	inline function get_lowerTwistAngle():Single return this.getF32(208);

	inline function set_lowerTwistAngle(value:Single):Single { this.setF32(208, value); return value; }
	public var upperTwistAngle(get, set):Single;

	inline function get_upperTwistAngle():Single return this.getF32(212);

	inline function set_upperTwistAngle(value:Single):Single { this.setF32(212, value); return value; }
	public var enableLimitSpring(get, set):Bool;

	inline function get_enableLimitSpring():Bool return this.getUI8(238) != 0;

	inline function set_enableLimitSpring(value:Bool):Bool { this.setUI8(238, value ? 1 : 0); return value; }
	public var limitFrequencyHz(get, set):Single;

	inline function get_limitFrequencyHz():Single return this.getF32(216);

	inline function set_limitFrequencyHz(value:Single):Single { this.setF32(216, value); return value; }
	public var limitDampingRatio(get, set):Single;

	inline function get_limitDampingRatio():Single return this.getF32(220);

	inline function set_limitDampingRatio(value:Single):Single { this.setF32(220, value); return value; }
	public var swingLimitImpulse(get, set):Single;

	inline function get_swingLimitImpulse():Single return this.getF32(224);

	inline function set_swingLimitImpulse(value:Single):Single { this.setF32(224, value); return value; }
	public var lowerTwistImpulse(get, set):Single;

	inline function get_lowerTwistImpulse():Single return this.getF32(228);

	inline function set_lowerTwistImpulse(value:Single):Single { this.setF32(228, value); return value; }
	public var upperTwistImpulse(get, set):Single;

	inline function get_upperTwistImpulse():Single return this.getF32(232);

	inline function set_upperTwistImpulse(value:Single):Single { this.setF32(232, value); return value; }
}
