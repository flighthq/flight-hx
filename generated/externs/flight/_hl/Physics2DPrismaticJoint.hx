package flight._hl;

private extern class Physics2DPrismaticJoint_Ffi {
	@:hlNative("flight", "flight_get_physics2_dprismatic_joint_enable_limit")
	static function get_enableLimit(ptr:hl.Bytes):Bool;
	@:hlNative("flight", "flight_set_physics2_dprismatic_joint_enable_limit")
	static function set_enableLimit(ptr:hl.Bytes, value:Bool):Bool;
	@:hlNative("flight", "flight_get_physics2_dprismatic_joint_enable_limit_spring")
	static function get_enableLimitSpring(ptr:hl.Bytes):Bool;
	@:hlNative("flight", "flight_set_physics2_dprismatic_joint_enable_limit_spring")
	static function set_enableLimitSpring(ptr:hl.Bytes, value:Bool):Bool;
	@:hlNative("flight", "flight_get_physics2_dprismatic_joint_enable_motor")
	static function get_enableMotor(ptr:hl.Bytes):Bool;
	@:hlNative("flight", "flight_set_physics2_dprismatic_joint_enable_motor")
	static function set_enableMotor(ptr:hl.Bytes, value:Bool):Bool;
	@:hlNative("flight", "flight_get_physics2_dprismatic_joint_limit_damping_ratio")
	static function get_limitDampingRatio(ptr:hl.Bytes):Single;
	@:hlNative("flight", "flight_set_physics2_dprismatic_joint_limit_damping_ratio")
	static function set_limitDampingRatio(ptr:hl.Bytes, value:Single):Single;
	@:hlNative("flight", "flight_get_physics2_dprismatic_joint_limit_frequency_hz")
	static function get_limitFrequencyHz(ptr:hl.Bytes):Single;
	@:hlNative("flight", "flight_set_physics2_dprismatic_joint_limit_frequency_hz")
	static function set_limitFrequencyHz(ptr:hl.Bytes, value:Single):Single;
	@:hlNative("flight", "flight_get_physics2_dprismatic_joint_local_axis_ax")
	static function get_localAxisAx(ptr:hl.Bytes):Single;
	@:hlNative("flight", "flight_set_physics2_dprismatic_joint_local_axis_ax")
	static function set_localAxisAx(ptr:hl.Bytes, value:Single):Single;
	@:hlNative("flight", "flight_get_physics2_dprismatic_joint_local_axis_ay")
	static function get_localAxisAy(ptr:hl.Bytes):Single;
	@:hlNative("flight", "flight_set_physics2_dprismatic_joint_local_axis_ay")
	static function set_localAxisAy(ptr:hl.Bytes, value:Single):Single;
	@:hlNative("flight", "flight_get_physics2_dprismatic_joint_lower_translation")
	static function get_lowerTranslation(ptr:hl.Bytes):Single;
	@:hlNative("flight", "flight_set_physics2_dprismatic_joint_lower_translation")
	static function set_lowerTranslation(ptr:hl.Bytes, value:Single):Single;
	@:hlNative("flight", "flight_get_physics2_dprismatic_joint_max_motor_force")
	static function get_maxMotorForce(ptr:hl.Bytes):Single;
	@:hlNative("flight", "flight_set_physics2_dprismatic_joint_max_motor_force")
	static function set_maxMotorForce(ptr:hl.Bytes, value:Single):Single;
	@:hlNative("flight", "flight_get_physics2_dprismatic_joint_motor_impulse")
	static function get_motorImpulse(ptr:hl.Bytes):Single;
	@:hlNative("flight", "flight_set_physics2_dprismatic_joint_motor_impulse")
	static function set_motorImpulse(ptr:hl.Bytes, value:Single):Single;
	@:hlNative("flight", "flight_get_physics2_dprismatic_joint_motor_speed")
	static function get_motorSpeed(ptr:hl.Bytes):Single;
	@:hlNative("flight", "flight_set_physics2_dprismatic_joint_motor_speed")
	static function set_motorSpeed(ptr:hl.Bytes, value:Single):Single;
	@:hlNative("flight", "flight_get_physics2_dprismatic_joint_reference_angle")
	static function get_referenceAngle(ptr:hl.Bytes):Single;
	@:hlNative("flight", "flight_set_physics2_dprismatic_joint_reference_angle")
	static function set_referenceAngle(ptr:hl.Bytes, value:Single):Single;
	@:hlNative("flight", "flight_get_physics2_dprismatic_joint_upper_translation")
	static function get_upperTranslation(ptr:hl.Bytes):Single;
	@:hlNative("flight", "flight_set_physics2_dprismatic_joint_upper_translation")
	static function set_upperTranslation(ptr:hl.Bytes, value:Single):Single;
}

abstract Physics2DPrismaticJoint(hl.Bytes) {
	public var enableLimit(get, set):Bool;

	inline function get_enableLimit():Bool return Physics2DPrismaticJoint_Ffi.get_enableLimit(this);
	inline function set_enableLimit(value:Bool):Bool { Physics2DPrismaticJoint_Ffi.set_enableLimit(this, value); return value; }
	public var enableLimitSpring(get, set):Bool;

	inline function get_enableLimitSpring():Bool return Physics2DPrismaticJoint_Ffi.get_enableLimitSpring(this);
	inline function set_enableLimitSpring(value:Bool):Bool { Physics2DPrismaticJoint_Ffi.set_enableLimitSpring(this, value); return value; }
	public var enableMotor(get, set):Bool;

	inline function get_enableMotor():Bool return Physics2DPrismaticJoint_Ffi.get_enableMotor(this);
	inline function set_enableMotor(value:Bool):Bool { Physics2DPrismaticJoint_Ffi.set_enableMotor(this, value); return value; }
	public var limitDampingRatio(get, set):Single;

	inline function get_limitDampingRatio():Single return Physics2DPrismaticJoint_Ffi.get_limitDampingRatio(this);
	inline function set_limitDampingRatio(value:Single):Single { Physics2DPrismaticJoint_Ffi.set_limitDampingRatio(this, value); return value; }
	public var limitFrequencyHz(get, set):Single;

	inline function get_limitFrequencyHz():Single return Physics2DPrismaticJoint_Ffi.get_limitFrequencyHz(this);
	inline function set_limitFrequencyHz(value:Single):Single { Physics2DPrismaticJoint_Ffi.set_limitFrequencyHz(this, value); return value; }
	public var localAxisAx(get, set):Single;

	inline function get_localAxisAx():Single return Physics2DPrismaticJoint_Ffi.get_localAxisAx(this);
	inline function set_localAxisAx(value:Single):Single { Physics2DPrismaticJoint_Ffi.set_localAxisAx(this, value); return value; }
	public var localAxisAy(get, set):Single;

	inline function get_localAxisAy():Single return Physics2DPrismaticJoint_Ffi.get_localAxisAy(this);
	inline function set_localAxisAy(value:Single):Single { Physics2DPrismaticJoint_Ffi.set_localAxisAy(this, value); return value; }
	public var lowerTranslation(get, set):Single;

	inline function get_lowerTranslation():Single return Physics2DPrismaticJoint_Ffi.get_lowerTranslation(this);
	inline function set_lowerTranslation(value:Single):Single { Physics2DPrismaticJoint_Ffi.set_lowerTranslation(this, value); return value; }
	public var maxMotorForce(get, set):Single;

	inline function get_maxMotorForce():Single return Physics2DPrismaticJoint_Ffi.get_maxMotorForce(this);
	inline function set_maxMotorForce(value:Single):Single { Physics2DPrismaticJoint_Ffi.set_maxMotorForce(this, value); return value; }
	public var motorImpulse(get, set):Single;

	inline function get_motorImpulse():Single return Physics2DPrismaticJoint_Ffi.get_motorImpulse(this);
	inline function set_motorImpulse(value:Single):Single { Physics2DPrismaticJoint_Ffi.set_motorImpulse(this, value); return value; }
	public var motorSpeed(get, set):Single;

	inline function get_motorSpeed():Single return Physics2DPrismaticJoint_Ffi.get_motorSpeed(this);
	inline function set_motorSpeed(value:Single):Single { Physics2DPrismaticJoint_Ffi.set_motorSpeed(this, value); return value; }
	public var referenceAngle(get, set):Single;

	inline function get_referenceAngle():Single return Physics2DPrismaticJoint_Ffi.get_referenceAngle(this);
	inline function set_referenceAngle(value:Single):Single { Physics2DPrismaticJoint_Ffi.set_referenceAngle(this, value); return value; }
	public var upperTranslation(get, set):Single;

	inline function get_upperTranslation():Single return Physics2DPrismaticJoint_Ffi.get_upperTranslation(this);
	inline function set_upperTranslation(value:Single):Single { Physics2DPrismaticJoint_Ffi.set_upperTranslation(this, value); return value; }
}
