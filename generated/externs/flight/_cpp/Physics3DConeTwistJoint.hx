package flight._cpp;

private extern class Physics3DConeTwistJoint_Ffi {
	@:native("flight_get_physics3_dcone_twist_joint_enable_swing_limit") static function get_enableSwingLimit(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_physics3_dcone_twist_joint_enable_swing_limit") static function set_enableSwingLimit(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_physics3_dcone_twist_joint_swing_limit_y") static function get_swingLimitY(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_physics3_dcone_twist_joint_swing_limit_y") static function set_swingLimitY(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_physics3_dcone_twist_joint_swing_limit_z") static function get_swingLimitZ(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_physics3_dcone_twist_joint_swing_limit_z") static function set_swingLimitZ(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_physics3_dcone_twist_joint_enable_twist_limit") static function get_enableTwistLimit(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_physics3_dcone_twist_joint_enable_twist_limit") static function set_enableTwistLimit(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_physics3_dcone_twist_joint_lower_twist_angle") static function get_lowerTwistAngle(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_physics3_dcone_twist_joint_lower_twist_angle") static function set_lowerTwistAngle(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_physics3_dcone_twist_joint_upper_twist_angle") static function get_upperTwistAngle(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_physics3_dcone_twist_joint_upper_twist_angle") static function set_upperTwistAngle(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_physics3_dcone_twist_joint_enable_limit_spring") static function get_enableLimitSpring(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_physics3_dcone_twist_joint_enable_limit_spring") static function set_enableLimitSpring(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_physics3_dcone_twist_joint_limit_frequency_hz") static function get_limitFrequencyHz(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_physics3_dcone_twist_joint_limit_frequency_hz") static function set_limitFrequencyHz(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_physics3_dcone_twist_joint_limit_damping_ratio") static function get_limitDampingRatio(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_physics3_dcone_twist_joint_limit_damping_ratio") static function set_limitDampingRatio(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_physics3_dcone_twist_joint_swing_limit_impulse") static function get_swingLimitImpulse(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_physics3_dcone_twist_joint_swing_limit_impulse") static function set_swingLimitImpulse(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_physics3_dcone_twist_joint_lower_twist_impulse") static function get_lowerTwistImpulse(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_physics3_dcone_twist_joint_lower_twist_impulse") static function set_lowerTwistImpulse(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_physics3_dcone_twist_joint_upper_twist_impulse") static function get_upperTwistImpulse(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_physics3_dcone_twist_joint_upper_twist_impulse") static function set_upperTwistImpulse(ptr:cpp.Star<cpp.Void>, value:Float):Float;
}

abstract Physics3DConeTwistJoint(cpp.Star<cpp.Void>) {
	public var enableSwingLimit(get, set):Bool;

	inline function get_enableSwingLimit():Bool return Physics3DConeTwistJoint_Ffi.get_enableSwingLimit(this);

	inline function set_enableSwingLimit(value:Bool):Bool { Physics3DConeTwistJoint_Ffi.set_enableSwingLimit(this, value); return value; }
	public var swingLimitY(get, set):Float;

	inline function get_swingLimitY():Float return Physics3DConeTwistJoint_Ffi.get_swingLimitY(this);

	inline function set_swingLimitY(value:Float):Float { Physics3DConeTwistJoint_Ffi.set_swingLimitY(this, value); return value; }
	public var swingLimitZ(get, set):Float;

	inline function get_swingLimitZ():Float return Physics3DConeTwistJoint_Ffi.get_swingLimitZ(this);

	inline function set_swingLimitZ(value:Float):Float { Physics3DConeTwistJoint_Ffi.set_swingLimitZ(this, value); return value; }
	public var enableTwistLimit(get, set):Bool;

	inline function get_enableTwistLimit():Bool return Physics3DConeTwistJoint_Ffi.get_enableTwistLimit(this);

	inline function set_enableTwistLimit(value:Bool):Bool { Physics3DConeTwistJoint_Ffi.set_enableTwistLimit(this, value); return value; }
	public var lowerTwistAngle(get, set):Float;

	inline function get_lowerTwistAngle():Float return Physics3DConeTwistJoint_Ffi.get_lowerTwistAngle(this);

	inline function set_lowerTwistAngle(value:Float):Float { Physics3DConeTwistJoint_Ffi.set_lowerTwistAngle(this, value); return value; }
	public var upperTwistAngle(get, set):Float;

	inline function get_upperTwistAngle():Float return Physics3DConeTwistJoint_Ffi.get_upperTwistAngle(this);

	inline function set_upperTwistAngle(value:Float):Float { Physics3DConeTwistJoint_Ffi.set_upperTwistAngle(this, value); return value; }
	public var enableLimitSpring(get, set):Bool;

	inline function get_enableLimitSpring():Bool return Physics3DConeTwistJoint_Ffi.get_enableLimitSpring(this);

	inline function set_enableLimitSpring(value:Bool):Bool { Physics3DConeTwistJoint_Ffi.set_enableLimitSpring(this, value); return value; }
	public var limitFrequencyHz(get, set):Float;

	inline function get_limitFrequencyHz():Float return Physics3DConeTwistJoint_Ffi.get_limitFrequencyHz(this);

	inline function set_limitFrequencyHz(value:Float):Float { Physics3DConeTwistJoint_Ffi.set_limitFrequencyHz(this, value); return value; }
	public var limitDampingRatio(get, set):Float;

	inline function get_limitDampingRatio():Float return Physics3DConeTwistJoint_Ffi.get_limitDampingRatio(this);

	inline function set_limitDampingRatio(value:Float):Float { Physics3DConeTwistJoint_Ffi.set_limitDampingRatio(this, value); return value; }
	public var swingLimitImpulse(get, set):Float;

	inline function get_swingLimitImpulse():Float return Physics3DConeTwistJoint_Ffi.get_swingLimitImpulse(this);

	inline function set_swingLimitImpulse(value:Float):Float { Physics3DConeTwistJoint_Ffi.set_swingLimitImpulse(this, value); return value; }
	public var lowerTwistImpulse(get, set):Float;

	inline function get_lowerTwistImpulse():Float return Physics3DConeTwistJoint_Ffi.get_lowerTwistImpulse(this);

	inline function set_lowerTwistImpulse(value:Float):Float { Physics3DConeTwistJoint_Ffi.set_lowerTwistImpulse(this, value); return value; }
	public var upperTwistImpulse(get, set):Float;

	inline function get_upperTwistImpulse():Float return Physics3DConeTwistJoint_Ffi.get_upperTwistImpulse(this);

	inline function set_upperTwistImpulse(value:Float):Float { Physics3DConeTwistJoint_Ffi.set_upperTwistImpulse(this, value); return value; }
}
