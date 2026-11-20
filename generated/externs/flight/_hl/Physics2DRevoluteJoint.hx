package flight._hl;

private extern class Physics2DRevoluteJoint_Ffi {
	@:hlNative("flight", "flight_get_physics2_drevolute_joint_enable_limit")
	static function get_enableLimit(ptr:hl.Bytes):Bool;
	@:hlNative("flight", "flight_set_physics2_drevolute_joint_enable_limit")
	static function set_enableLimit(ptr:hl.Bytes, value:Bool):Bool;
	@:hlNative("flight", "flight_get_physics2_drevolute_joint_enable_limit_spring")
	static function get_enableLimitSpring(ptr:hl.Bytes):Bool;
	@:hlNative("flight", "flight_set_physics2_drevolute_joint_enable_limit_spring")
	static function set_enableLimitSpring(ptr:hl.Bytes, value:Bool):Bool;
	@:hlNative("flight", "flight_get_physics2_drevolute_joint_enable_motor")
	static function get_enableMotor(ptr:hl.Bytes):Bool;
	@:hlNative("flight", "flight_set_physics2_drevolute_joint_enable_motor")
	static function set_enableMotor(ptr:hl.Bytes, value:Bool):Bool;
	@:hlNative("flight", "flight_get_physics2_drevolute_joint_limit_damping_ratio")
	static function get_limitDampingRatio(ptr:hl.Bytes):Float;
	@:hlNative("flight", "flight_set_physics2_drevolute_joint_limit_damping_ratio")
	static function set_limitDampingRatio(ptr:hl.Bytes, value:Float):Float;
	@:hlNative("flight", "flight_get_physics2_drevolute_joint_limit_frequency_hz")
	static function get_limitFrequencyHz(ptr:hl.Bytes):Float;
	@:hlNative("flight", "flight_set_physics2_drevolute_joint_limit_frequency_hz")
	static function set_limitFrequencyHz(ptr:hl.Bytes, value:Float):Float;
	@:hlNative("flight", "flight_get_physics2_drevolute_joint_lower_angle")
	static function get_lowerAngle(ptr:hl.Bytes):Float;
	@:hlNative("flight", "flight_set_physics2_drevolute_joint_lower_angle")
	static function set_lowerAngle(ptr:hl.Bytes, value:Float):Float;
	@:hlNative("flight", "flight_get_physics2_drevolute_joint_max_motor_torque")
	static function get_maxMotorTorque(ptr:hl.Bytes):Float;
	@:hlNative("flight", "flight_set_physics2_drevolute_joint_max_motor_torque")
	static function set_maxMotorTorque(ptr:hl.Bytes, value:Float):Float;
	@:hlNative("flight", "flight_get_physics2_drevolute_joint_motor_impulse")
	static function get_motorImpulse(ptr:hl.Bytes):Float;
	@:hlNative("flight", "flight_set_physics2_drevolute_joint_motor_impulse")
	static function set_motorImpulse(ptr:hl.Bytes, value:Float):Float;
	@:hlNative("flight", "flight_get_physics2_drevolute_joint_motor_speed")
	static function get_motorSpeed(ptr:hl.Bytes):Float;
	@:hlNative("flight", "flight_set_physics2_drevolute_joint_motor_speed")
	static function set_motorSpeed(ptr:hl.Bytes, value:Float):Float;
	@:hlNative("flight", "flight_get_physics2_drevolute_joint_reference_angle")
	static function get_referenceAngle(ptr:hl.Bytes):Float;
	@:hlNative("flight", "flight_set_physics2_drevolute_joint_reference_angle")
	static function set_referenceAngle(ptr:hl.Bytes, value:Float):Float;
	@:hlNative("flight", "flight_get_physics2_drevolute_joint_upper_angle")
	static function get_upperAngle(ptr:hl.Bytes):Float;
	@:hlNative("flight", "flight_set_physics2_drevolute_joint_upper_angle")
	static function set_upperAngle(ptr:hl.Bytes, value:Float):Float;
}

abstract Physics2DRevoluteJoint(hl.Bytes) {
	public var enableLimit(get, set):Bool;

	inline function get_enableLimit():Bool return Physics2DRevoluteJoint_Ffi.get_enableLimit(this);

	inline function set_enableLimit(value:Bool):Bool { Physics2DRevoluteJoint_Ffi.set_enableLimit(this, value); return value; }
	public var enableLimitSpring(get, set):Bool;

	inline function get_enableLimitSpring():Bool return Physics2DRevoluteJoint_Ffi.get_enableLimitSpring(this);

	inline function set_enableLimitSpring(value:Bool):Bool { Physics2DRevoluteJoint_Ffi.set_enableLimitSpring(this, value); return value; }
	public var enableMotor(get, set):Bool;

	inline function get_enableMotor():Bool return Physics2DRevoluteJoint_Ffi.get_enableMotor(this);

	inline function set_enableMotor(value:Bool):Bool { Physics2DRevoluteJoint_Ffi.set_enableMotor(this, value); return value; }
	public var limitDampingRatio(get, set):Float;

	inline function get_limitDampingRatio():Float return Physics2DRevoluteJoint_Ffi.get_limitDampingRatio(this);

	inline function set_limitDampingRatio(value:Float):Float { Physics2DRevoluteJoint_Ffi.set_limitDampingRatio(this, value); return value; }
	public var limitFrequencyHz(get, set):Float;

	inline function get_limitFrequencyHz():Float return Physics2DRevoluteJoint_Ffi.get_limitFrequencyHz(this);

	inline function set_limitFrequencyHz(value:Float):Float { Physics2DRevoluteJoint_Ffi.set_limitFrequencyHz(this, value); return value; }
	public var lowerAngle(get, set):Float;

	inline function get_lowerAngle():Float return Physics2DRevoluteJoint_Ffi.get_lowerAngle(this);

	inline function set_lowerAngle(value:Float):Float { Physics2DRevoluteJoint_Ffi.set_lowerAngle(this, value); return value; }
	public var maxMotorTorque(get, set):Float;

	inline function get_maxMotorTorque():Float return Physics2DRevoluteJoint_Ffi.get_maxMotorTorque(this);

	inline function set_maxMotorTorque(value:Float):Float { Physics2DRevoluteJoint_Ffi.set_maxMotorTorque(this, value); return value; }
	public var motorImpulse(get, set):Float;

	inline function get_motorImpulse():Float return Physics2DRevoluteJoint_Ffi.get_motorImpulse(this);

	inline function set_motorImpulse(value:Float):Float { Physics2DRevoluteJoint_Ffi.set_motorImpulse(this, value); return value; }
	public var motorSpeed(get, set):Float;

	inline function get_motorSpeed():Float return Physics2DRevoluteJoint_Ffi.get_motorSpeed(this);

	inline function set_motorSpeed(value:Float):Float { Physics2DRevoluteJoint_Ffi.set_motorSpeed(this, value); return value; }
	public var referenceAngle(get, set):Float;

	inline function get_referenceAngle():Float return Physics2DRevoluteJoint_Ffi.get_referenceAngle(this);

	inline function set_referenceAngle(value:Float):Float { Physics2DRevoluteJoint_Ffi.set_referenceAngle(this, value); return value; }
	public var upperAngle(get, set):Float;

	inline function get_upperAngle():Float return Physics2DRevoluteJoint_Ffi.get_upperAngle(this);

	inline function set_upperAngle(value:Float):Float { Physics2DRevoluteJoint_Ffi.set_upperAngle(this, value); return value; }
}
