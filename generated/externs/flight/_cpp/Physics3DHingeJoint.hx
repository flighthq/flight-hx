package flight._cpp;

private extern class Physics3DHingeJoint_Ffi {
	@:native("flight_get_physics3_dhinge_joint_enable_limit") static function get_enableLimit(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_physics3_dhinge_joint_enable_limit") static function set_enableLimit(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_physics3_dhinge_joint_lower_angle") static function get_lowerAngle(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics3_dhinge_joint_lower_angle") static function set_lowerAngle(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics3_dhinge_joint_upper_angle") static function get_upperAngle(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics3_dhinge_joint_upper_angle") static function set_upperAngle(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics3_dhinge_joint_enable_motor") static function get_enableMotor(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_physics3_dhinge_joint_enable_motor") static function set_enableMotor(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_physics3_dhinge_joint_motor_speed") static function get_motorSpeed(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics3_dhinge_joint_motor_speed") static function set_motorSpeed(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics3_dhinge_joint_max_motor_torque") static function get_maxMotorTorque(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics3_dhinge_joint_max_motor_torque") static function set_maxMotorTorque(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics3_dhinge_joint_motor_impulse") static function get_motorImpulse(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics3_dhinge_joint_motor_impulse") static function set_motorImpulse(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics3_dhinge_joint_enable_limit_spring") static function get_enableLimitSpring(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_physics3_dhinge_joint_enable_limit_spring") static function set_enableLimitSpring(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_physics3_dhinge_joint_limit_frequency_hz") static function get_limitFrequencyHz(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics3_dhinge_joint_limit_frequency_hz") static function set_limitFrequencyHz(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics3_dhinge_joint_limit_damping_ratio") static function get_limitDampingRatio(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics3_dhinge_joint_limit_damping_ratio") static function set_limitDampingRatio(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics3_dhinge_joint_lower_limit_impulse") static function get_lowerLimitImpulse(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics3_dhinge_joint_lower_limit_impulse") static function set_lowerLimitImpulse(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics3_dhinge_joint_upper_limit_impulse") static function get_upperLimitImpulse(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics3_dhinge_joint_upper_limit_impulse") static function set_upperLimitImpulse(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract Physics3DHingeJoint(cpp.Star<cpp.Void>) {
	public var enableLimit(get, set):Bool;

	inline function get_enableLimit():Bool return Physics3DHingeJoint_Ffi.get_enableLimit(this);

	inline function set_enableLimit(value:Bool):Bool { Physics3DHingeJoint_Ffi.set_enableLimit(this, value); return value; }
	public var lowerAngle(get, set):Single;

	inline function get_lowerAngle():Single return Physics3DHingeJoint_Ffi.get_lowerAngle(this);

	inline function set_lowerAngle(value:Single):Single { Physics3DHingeJoint_Ffi.set_lowerAngle(this, value); return value; }
	public var upperAngle(get, set):Single;

	inline function get_upperAngle():Single return Physics3DHingeJoint_Ffi.get_upperAngle(this);

	inline function set_upperAngle(value:Single):Single { Physics3DHingeJoint_Ffi.set_upperAngle(this, value); return value; }
	public var enableMotor(get, set):Bool;

	inline function get_enableMotor():Bool return Physics3DHingeJoint_Ffi.get_enableMotor(this);

	inline function set_enableMotor(value:Bool):Bool { Physics3DHingeJoint_Ffi.set_enableMotor(this, value); return value; }
	public var motorSpeed(get, set):Single;

	inline function get_motorSpeed():Single return Physics3DHingeJoint_Ffi.get_motorSpeed(this);

	inline function set_motorSpeed(value:Single):Single { Physics3DHingeJoint_Ffi.set_motorSpeed(this, value); return value; }
	public var maxMotorTorque(get, set):Single;

	inline function get_maxMotorTorque():Single return Physics3DHingeJoint_Ffi.get_maxMotorTorque(this);

	inline function set_maxMotorTorque(value:Single):Single { Physics3DHingeJoint_Ffi.set_maxMotorTorque(this, value); return value; }
	public var motorImpulse(get, set):Single;

	inline function get_motorImpulse():Single return Physics3DHingeJoint_Ffi.get_motorImpulse(this);

	inline function set_motorImpulse(value:Single):Single { Physics3DHingeJoint_Ffi.set_motorImpulse(this, value); return value; }
	public var enableLimitSpring(get, set):Bool;

	inline function get_enableLimitSpring():Bool return Physics3DHingeJoint_Ffi.get_enableLimitSpring(this);

	inline function set_enableLimitSpring(value:Bool):Bool { Physics3DHingeJoint_Ffi.set_enableLimitSpring(this, value); return value; }
	public var limitFrequencyHz(get, set):Single;

	inline function get_limitFrequencyHz():Single return Physics3DHingeJoint_Ffi.get_limitFrequencyHz(this);

	inline function set_limitFrequencyHz(value:Single):Single { Physics3DHingeJoint_Ffi.set_limitFrequencyHz(this, value); return value; }
	public var limitDampingRatio(get, set):Single;

	inline function get_limitDampingRatio():Single return Physics3DHingeJoint_Ffi.get_limitDampingRatio(this);

	inline function set_limitDampingRatio(value:Single):Single { Physics3DHingeJoint_Ffi.set_limitDampingRatio(this, value); return value; }
	public var lowerLimitImpulse(get, set):Single;

	inline function get_lowerLimitImpulse():Single return Physics3DHingeJoint_Ffi.get_lowerLimitImpulse(this);

	inline function set_lowerLimitImpulse(value:Single):Single { Physics3DHingeJoint_Ffi.set_lowerLimitImpulse(this, value); return value; }
	public var upperLimitImpulse(get, set):Single;

	inline function get_upperLimitImpulse():Single return Physics3DHingeJoint_Ffi.get_upperLimitImpulse(this);

	inline function set_upperLimitImpulse(value:Single):Single { Physics3DHingeJoint_Ffi.set_upperLimitImpulse(this, value); return value; }
}
