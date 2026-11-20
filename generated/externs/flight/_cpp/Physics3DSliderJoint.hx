package flight._cpp;

private extern class Physics3DSliderJoint_Ffi {
	@:native("flight_get_physics3_dslider_joint_enable_limit") static function get_enableLimit(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_physics3_dslider_joint_enable_limit") static function set_enableLimit(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_physics3_dslider_joint_lower_translation") static function get_lowerTranslation(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_physics3_dslider_joint_lower_translation") static function set_lowerTranslation(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_physics3_dslider_joint_upper_translation") static function get_upperTranslation(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_physics3_dslider_joint_upper_translation") static function set_upperTranslation(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_physics3_dslider_joint_enable_motor") static function get_enableMotor(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_physics3_dslider_joint_enable_motor") static function set_enableMotor(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_physics3_dslider_joint_motor_speed") static function get_motorSpeed(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_physics3_dslider_joint_motor_speed") static function set_motorSpeed(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_physics3_dslider_joint_max_motor_force") static function get_maxMotorForce(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_physics3_dslider_joint_max_motor_force") static function set_maxMotorForce(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_physics3_dslider_joint_motor_impulse") static function get_motorImpulse(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_physics3_dslider_joint_motor_impulse") static function set_motorImpulse(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_physics3_dslider_joint_enable_limit_spring") static function get_enableLimitSpring(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_physics3_dslider_joint_enable_limit_spring") static function set_enableLimitSpring(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_physics3_dslider_joint_limit_frequency_hz") static function get_limitFrequencyHz(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_physics3_dslider_joint_limit_frequency_hz") static function set_limitFrequencyHz(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_physics3_dslider_joint_limit_damping_ratio") static function get_limitDampingRatio(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_physics3_dslider_joint_limit_damping_ratio") static function set_limitDampingRatio(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_physics3_dslider_joint_lower_limit_impulse") static function get_lowerLimitImpulse(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_physics3_dslider_joint_lower_limit_impulse") static function set_lowerLimitImpulse(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_physics3_dslider_joint_upper_limit_impulse") static function get_upperLimitImpulse(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_physics3_dslider_joint_upper_limit_impulse") static function set_upperLimitImpulse(ptr:cpp.Star<cpp.Void>, value:Float):Float;
}

abstract Physics3DSliderJoint(cpp.Star<cpp.Void>) {
	public var enableLimit(get, set):Bool;

	inline function get_enableLimit():Bool return Physics3DSliderJoint_Ffi.get_enableLimit(this);

	inline function set_enableLimit(value:Bool):Bool { Physics3DSliderJoint_Ffi.set_enableLimit(this, value); return value; }
	public var lowerTranslation(get, set):Float;

	inline function get_lowerTranslation():Float return Physics3DSliderJoint_Ffi.get_lowerTranslation(this);

	inline function set_lowerTranslation(value:Float):Float { Physics3DSliderJoint_Ffi.set_lowerTranslation(this, value); return value; }
	public var upperTranslation(get, set):Float;

	inline function get_upperTranslation():Float return Physics3DSliderJoint_Ffi.get_upperTranslation(this);

	inline function set_upperTranslation(value:Float):Float { Physics3DSliderJoint_Ffi.set_upperTranslation(this, value); return value; }
	public var enableMotor(get, set):Bool;

	inline function get_enableMotor():Bool return Physics3DSliderJoint_Ffi.get_enableMotor(this);

	inline function set_enableMotor(value:Bool):Bool { Physics3DSliderJoint_Ffi.set_enableMotor(this, value); return value; }
	public var motorSpeed(get, set):Float;

	inline function get_motorSpeed():Float return Physics3DSliderJoint_Ffi.get_motorSpeed(this);

	inline function set_motorSpeed(value:Float):Float { Physics3DSliderJoint_Ffi.set_motorSpeed(this, value); return value; }
	public var maxMotorForce(get, set):Float;

	inline function get_maxMotorForce():Float return Physics3DSliderJoint_Ffi.get_maxMotorForce(this);

	inline function set_maxMotorForce(value:Float):Float { Physics3DSliderJoint_Ffi.set_maxMotorForce(this, value); return value; }
	public var motorImpulse(get, set):Float;

	inline function get_motorImpulse():Float return Physics3DSliderJoint_Ffi.get_motorImpulse(this);

	inline function set_motorImpulse(value:Float):Float { Physics3DSliderJoint_Ffi.set_motorImpulse(this, value); return value; }
	public var enableLimitSpring(get, set):Bool;

	inline function get_enableLimitSpring():Bool return Physics3DSliderJoint_Ffi.get_enableLimitSpring(this);

	inline function set_enableLimitSpring(value:Bool):Bool { Physics3DSliderJoint_Ffi.set_enableLimitSpring(this, value); return value; }
	public var limitFrequencyHz(get, set):Float;

	inline function get_limitFrequencyHz():Float return Physics3DSliderJoint_Ffi.get_limitFrequencyHz(this);

	inline function set_limitFrequencyHz(value:Float):Float { Physics3DSliderJoint_Ffi.set_limitFrequencyHz(this, value); return value; }
	public var limitDampingRatio(get, set):Float;

	inline function get_limitDampingRatio():Float return Physics3DSliderJoint_Ffi.get_limitDampingRatio(this);

	inline function set_limitDampingRatio(value:Float):Float { Physics3DSliderJoint_Ffi.set_limitDampingRatio(this, value); return value; }
	public var lowerLimitImpulse(get, set):Float;

	inline function get_lowerLimitImpulse():Float return Physics3DSliderJoint_Ffi.get_lowerLimitImpulse(this);

	inline function set_lowerLimitImpulse(value:Float):Float { Physics3DSliderJoint_Ffi.set_lowerLimitImpulse(this, value); return value; }
	public var upperLimitImpulse(get, set):Float;

	inline function get_upperLimitImpulse():Float return Physics3DSliderJoint_Ffi.get_upperLimitImpulse(this);

	inline function set_upperLimitImpulse(value:Float):Float { Physics3DSliderJoint_Ffi.set_upperLimitImpulse(this, value); return value; }
}
