package flight._cpp;

private extern class Physics2DWheelJoint_Ffi {
	@:native("flight_get_physics2_dwheel_joint_damping_ratio") static function get_dampingRatio(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics2_dwheel_joint_damping_ratio") static function set_dampingRatio(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics2_dwheel_joint_enable_motor") static function get_enableMotor(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_physics2_dwheel_joint_enable_motor") static function set_enableMotor(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_physics2_dwheel_joint_frequency_hz") static function get_frequencyHz(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics2_dwheel_joint_frequency_hz") static function set_frequencyHz(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics2_dwheel_joint_local_axis_ax") static function get_localAxisAx(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics2_dwheel_joint_local_axis_ax") static function set_localAxisAx(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics2_dwheel_joint_local_axis_ay") static function get_localAxisAy(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics2_dwheel_joint_local_axis_ay") static function set_localAxisAy(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics2_dwheel_joint_max_motor_torque") static function get_maxMotorTorque(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics2_dwheel_joint_max_motor_torque") static function set_maxMotorTorque(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics2_dwheel_joint_motor_impulse") static function get_motorImpulse(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics2_dwheel_joint_motor_impulse") static function set_motorImpulse(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics2_dwheel_joint_motor_speed") static function get_motorSpeed(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics2_dwheel_joint_motor_speed") static function set_motorSpeed(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics2_dwheel_joint_rest_translation") static function get_restTranslation(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics2_dwheel_joint_rest_translation") static function set_restTranslation(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract Physics2DWheelJoint(cpp.Star<cpp.Void>) {
	public var dampingRatio(get, set):Single;

	inline function get_dampingRatio():Single return Physics2DWheelJoint_Ffi.get_dampingRatio(this);

	inline function set_dampingRatio(value:Single):Single return Physics2DWheelJoint_Ffi.set_dampingRatio(this, value);
	public var enableMotor(get, set):Bool;

	inline function get_enableMotor():Bool return Physics2DWheelJoint_Ffi.get_enableMotor(this);

	inline function set_enableMotor(value:Bool):Bool return Physics2DWheelJoint_Ffi.set_enableMotor(this, value);
	public var frequencyHz(get, set):Single;

	inline function get_frequencyHz():Single return Physics2DWheelJoint_Ffi.get_frequencyHz(this);

	inline function set_frequencyHz(value:Single):Single return Physics2DWheelJoint_Ffi.set_frequencyHz(this, value);
	public var localAxisAx(get, set):Single;

	inline function get_localAxisAx():Single return Physics2DWheelJoint_Ffi.get_localAxisAx(this);

	inline function set_localAxisAx(value:Single):Single return Physics2DWheelJoint_Ffi.set_localAxisAx(this, value);
	public var localAxisAy(get, set):Single;

	inline function get_localAxisAy():Single return Physics2DWheelJoint_Ffi.get_localAxisAy(this);

	inline function set_localAxisAy(value:Single):Single return Physics2DWheelJoint_Ffi.set_localAxisAy(this, value);
	public var maxMotorTorque(get, set):Single;

	inline function get_maxMotorTorque():Single return Physics2DWheelJoint_Ffi.get_maxMotorTorque(this);

	inline function set_maxMotorTorque(value:Single):Single return Physics2DWheelJoint_Ffi.set_maxMotorTorque(this, value);
	public var motorImpulse(get, set):Single;

	inline function get_motorImpulse():Single return Physics2DWheelJoint_Ffi.get_motorImpulse(this);

	inline function set_motorImpulse(value:Single):Single return Physics2DWheelJoint_Ffi.set_motorImpulse(this, value);
	public var motorSpeed(get, set):Single;

	inline function get_motorSpeed():Single return Physics2DWheelJoint_Ffi.get_motorSpeed(this);

	inline function set_motorSpeed(value:Single):Single return Physics2DWheelJoint_Ffi.set_motorSpeed(this, value);
	public var restTranslation(get, set):Single;

	inline function get_restTranslation():Single return Physics2DWheelJoint_Ffi.get_restTranslation(this);

	inline function set_restTranslation(value:Single):Single return Physics2DWheelJoint_Ffi.set_restTranslation(this, value);
}
