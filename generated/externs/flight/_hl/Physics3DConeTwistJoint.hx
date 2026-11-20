package flight._hl;

abstract Physics3DConeTwistJoint(hl.Bytes) {
	public var enableSwingLimit(get, set):Bool;

	inline function get_enableSwingLimit():Bool return this.getUI8(384) != 0;

	inline function set_enableSwingLimit(value:Bool):Bool { this.setUI8(384, value ? 1 : 0); return value; }
	public var swingLimitY(get, set):Float;

	inline function get_swingLimitY():Float return this.getF64(312);

	inline function set_swingLimitY(value:Float):Float { this.setF64(312, value); return value; }
	public var swingLimitZ(get, set):Float;

	inline function get_swingLimitZ():Float return this.getF64(320);

	inline function set_swingLimitZ(value:Float):Float { this.setF64(320, value); return value; }
	public var enableTwistLimit(get, set):Bool;

	inline function get_enableTwistLimit():Bool return this.getUI8(385) != 0;

	inline function set_enableTwistLimit(value:Bool):Bool { this.setUI8(385, value ? 1 : 0); return value; }
	public var lowerTwistAngle(get, set):Float;

	inline function get_lowerTwistAngle():Float return this.getF64(328);

	inline function set_lowerTwistAngle(value:Float):Float { this.setF64(328, value); return value; }
	public var upperTwistAngle(get, set):Float;

	inline function get_upperTwistAngle():Float return this.getF64(336);

	inline function set_upperTwistAngle(value:Float):Float { this.setF64(336, value); return value; }
	public var enableLimitSpring(get, set):Bool;

	inline function get_enableLimitSpring():Bool return this.getUI8(386) != 0;

	inline function set_enableLimitSpring(value:Bool):Bool { this.setUI8(386, value ? 1 : 0); return value; }
	public var limitFrequencyHz(get, set):Float;

	inline function get_limitFrequencyHz():Float return this.getF64(344);

	inline function set_limitFrequencyHz(value:Float):Float { this.setF64(344, value); return value; }
	public var limitDampingRatio(get, set):Float;

	inline function get_limitDampingRatio():Float return this.getF64(352);

	inline function set_limitDampingRatio(value:Float):Float { this.setF64(352, value); return value; }
	public var swingLimitImpulse(get, set):Float;

	inline function get_swingLimitImpulse():Float return this.getF64(360);

	inline function set_swingLimitImpulse(value:Float):Float { this.setF64(360, value); return value; }
	public var lowerTwistImpulse(get, set):Float;

	inline function get_lowerTwistImpulse():Float return this.getF64(368);

	inline function set_lowerTwistImpulse(value:Float):Float { this.setF64(368, value); return value; }
	public var upperTwistImpulse(get, set):Float;

	inline function get_upperTwistImpulse():Float return this.getF64(376);

	inline function set_upperTwistImpulse(value:Float):Float { this.setF64(376, value); return value; }
}
