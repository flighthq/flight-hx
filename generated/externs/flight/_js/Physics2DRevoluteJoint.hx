package flight._js;

@:jsRequire("flight")
private extern class Physics2DRevoluteJoint_Ffi {
	@:native("flight_get_physics2_drevolute_joint_enable_limit") static function get_enableLimit(ptr:Dynamic):Bool;
	@:native("flight_set_physics2_drevolute_joint_enable_limit") static function set_enableLimit(ptr:Dynamic, value:Bool):Bool;
	@:native("flight_get_physics2_drevolute_joint_enable_limit_spring") static function get_enableLimitSpring(ptr:Dynamic):Bool;
	@:native("flight_set_physics2_drevolute_joint_enable_limit_spring") static function set_enableLimitSpring(ptr:Dynamic, value:Bool):Bool;
	@:native("flight_get_physics2_drevolute_joint_enable_motor") static function get_enableMotor(ptr:Dynamic):Bool;
	@:native("flight_set_physics2_drevolute_joint_enable_motor") static function set_enableMotor(ptr:Dynamic, value:Bool):Bool;
	@:native("flight_get_physics2_drevolute_joint_limit_damping_ratio") static function get_limitDampingRatio(ptr:Dynamic):Float;
	@:native("flight_set_physics2_drevolute_joint_limit_damping_ratio") static function set_limitDampingRatio(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_physics2_drevolute_joint_limit_frequency_hz") static function get_limitFrequencyHz(ptr:Dynamic):Float;
	@:native("flight_set_physics2_drevolute_joint_limit_frequency_hz") static function set_limitFrequencyHz(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_physics2_drevolute_joint_lower_angle") static function get_lowerAngle(ptr:Dynamic):Float;
	@:native("flight_set_physics2_drevolute_joint_lower_angle") static function set_lowerAngle(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_physics2_drevolute_joint_max_motor_torque") static function get_maxMotorTorque(ptr:Dynamic):Float;
	@:native("flight_set_physics2_drevolute_joint_max_motor_torque") static function set_maxMotorTorque(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_physics2_drevolute_joint_motor_impulse") static function get_motorImpulse(ptr:Dynamic):Float;
	@:native("flight_set_physics2_drevolute_joint_motor_impulse") static function set_motorImpulse(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_physics2_drevolute_joint_motor_speed") static function get_motorSpeed(ptr:Dynamic):Float;
	@:native("flight_set_physics2_drevolute_joint_motor_speed") static function set_motorSpeed(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_physics2_drevolute_joint_reference_angle") static function get_referenceAngle(ptr:Dynamic):Float;
	@:native("flight_set_physics2_drevolute_joint_reference_angle") static function set_referenceAngle(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_physics2_drevolute_joint_upper_angle") static function get_upperAngle(ptr:Dynamic):Float;
	@:native("flight_set_physics2_drevolute_joint_upper_angle") static function set_upperAngle(ptr:Dynamic, value:Float):Float;
}

abstract Physics2DRevoluteJoint(Dynamic) {
	public var enableLimit(get, set):Bool;

	inline function get_enableLimit():Bool return Physics2DRevoluteJoint_Ffi.get_enableLimit(this);

	inline function set_enableLimit(value:Bool):Bool return Physics2DRevoluteJoint_Ffi.set_enableLimit(this, value);
	public var enableLimitSpring(get, set):Bool;

	inline function get_enableLimitSpring():Bool return Physics2DRevoluteJoint_Ffi.get_enableLimitSpring(this);

	inline function set_enableLimitSpring(value:Bool):Bool return Physics2DRevoluteJoint_Ffi.set_enableLimitSpring(this, value);
	public var enableMotor(get, set):Bool;

	inline function get_enableMotor():Bool return Physics2DRevoluteJoint_Ffi.get_enableMotor(this);

	inline function set_enableMotor(value:Bool):Bool return Physics2DRevoluteJoint_Ffi.set_enableMotor(this, value);
	public var limitDampingRatio(get, set):Float;

	inline function get_limitDampingRatio():Float return Physics2DRevoluteJoint_Ffi.get_limitDampingRatio(this);

	inline function set_limitDampingRatio(value:Float):Float return Physics2DRevoluteJoint_Ffi.set_limitDampingRatio(this, value);
	public var limitFrequencyHz(get, set):Float;

	inline function get_limitFrequencyHz():Float return Physics2DRevoluteJoint_Ffi.get_limitFrequencyHz(this);

	inline function set_limitFrequencyHz(value:Float):Float return Physics2DRevoluteJoint_Ffi.set_limitFrequencyHz(this, value);
	public var lowerAngle(get, set):Float;

	inline function get_lowerAngle():Float return Physics2DRevoluteJoint_Ffi.get_lowerAngle(this);

	inline function set_lowerAngle(value:Float):Float return Physics2DRevoluteJoint_Ffi.set_lowerAngle(this, value);
	public var maxMotorTorque(get, set):Float;

	inline function get_maxMotorTorque():Float return Physics2DRevoluteJoint_Ffi.get_maxMotorTorque(this);

	inline function set_maxMotorTorque(value:Float):Float return Physics2DRevoluteJoint_Ffi.set_maxMotorTorque(this, value);
	public var motorImpulse(get, set):Float;

	inline function get_motorImpulse():Float return Physics2DRevoluteJoint_Ffi.get_motorImpulse(this);

	inline function set_motorImpulse(value:Float):Float return Physics2DRevoluteJoint_Ffi.set_motorImpulse(this, value);
	public var motorSpeed(get, set):Float;

	inline function get_motorSpeed():Float return Physics2DRevoluteJoint_Ffi.get_motorSpeed(this);

	inline function set_motorSpeed(value:Float):Float return Physics2DRevoluteJoint_Ffi.set_motorSpeed(this, value);
	public var referenceAngle(get, set):Float;

	inline function get_referenceAngle():Float return Physics2DRevoluteJoint_Ffi.get_referenceAngle(this);

	inline function set_referenceAngle(value:Float):Float return Physics2DRevoluteJoint_Ffi.set_referenceAngle(this, value);
	public var upperAngle(get, set):Float;

	inline function get_upperAngle():Float return Physics2DRevoluteJoint_Ffi.get_upperAngle(this);

	inline function set_upperAngle(value:Float):Float return Physics2DRevoluteJoint_Ffi.set_upperAngle(this, value);
}
