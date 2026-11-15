package flight._js;

@:jsRequire("flight")
private extern class Physics2DWheelJoint_Ffi {
	@:native("flight_get_physics2_dwheel_joint_damping_ratio") static function get_dampingRatio(ptr:Dynamic):Float;
	@:native("flight_set_physics2_dwheel_joint_damping_ratio") static function set_dampingRatio(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_physics2_dwheel_joint_enable_motor") static function get_enableMotor(ptr:Dynamic):Bool;
	@:native("flight_set_physics2_dwheel_joint_enable_motor") static function set_enableMotor(ptr:Dynamic, value:Bool):Bool;
	@:native("flight_get_physics2_dwheel_joint_frequency_hz") static function get_frequencyHz(ptr:Dynamic):Float;
	@:native("flight_set_physics2_dwheel_joint_frequency_hz") static function set_frequencyHz(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_physics2_dwheel_joint_local_axis_ax") static function get_localAxisAx(ptr:Dynamic):Float;
	@:native("flight_set_physics2_dwheel_joint_local_axis_ax") static function set_localAxisAx(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_physics2_dwheel_joint_local_axis_ay") static function get_localAxisAy(ptr:Dynamic):Float;
	@:native("flight_set_physics2_dwheel_joint_local_axis_ay") static function set_localAxisAy(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_physics2_dwheel_joint_max_motor_torque") static function get_maxMotorTorque(ptr:Dynamic):Float;
	@:native("flight_set_physics2_dwheel_joint_max_motor_torque") static function set_maxMotorTorque(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_physics2_dwheel_joint_motor_impulse") static function get_motorImpulse(ptr:Dynamic):Float;
	@:native("flight_set_physics2_dwheel_joint_motor_impulse") static function set_motorImpulse(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_physics2_dwheel_joint_motor_speed") static function get_motorSpeed(ptr:Dynamic):Float;
	@:native("flight_set_physics2_dwheel_joint_motor_speed") static function set_motorSpeed(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_physics2_dwheel_joint_rest_translation") static function get_restTranslation(ptr:Dynamic):Float;
	@:native("flight_set_physics2_dwheel_joint_rest_translation") static function set_restTranslation(ptr:Dynamic, value:Float):Float;
}

abstract Physics2DWheelJoint(Dynamic) {
	public var dampingRatio(get, set):Float;

	inline function get_dampingRatio():Float return Physics2DWheelJoint_Ffi.get_dampingRatio(this);

	inline function set_dampingRatio(value:Float):Float return Physics2DWheelJoint_Ffi.set_dampingRatio(this, value);
	public var enableMotor(get, set):Bool;

	inline function get_enableMotor():Bool return Physics2DWheelJoint_Ffi.get_enableMotor(this);

	inline function set_enableMotor(value:Bool):Bool return Physics2DWheelJoint_Ffi.set_enableMotor(this, value);
	public var frequencyHz(get, set):Float;

	inline function get_frequencyHz():Float return Physics2DWheelJoint_Ffi.get_frequencyHz(this);

	inline function set_frequencyHz(value:Float):Float return Physics2DWheelJoint_Ffi.set_frequencyHz(this, value);
	public var localAxisAx(get, set):Float;

	inline function get_localAxisAx():Float return Physics2DWheelJoint_Ffi.get_localAxisAx(this);

	inline function set_localAxisAx(value:Float):Float return Physics2DWheelJoint_Ffi.set_localAxisAx(this, value);
	public var localAxisAy(get, set):Float;

	inline function get_localAxisAy():Float return Physics2DWheelJoint_Ffi.get_localAxisAy(this);

	inline function set_localAxisAy(value:Float):Float return Physics2DWheelJoint_Ffi.set_localAxisAy(this, value);
	public var maxMotorTorque(get, set):Float;

	inline function get_maxMotorTorque():Float return Physics2DWheelJoint_Ffi.get_maxMotorTorque(this);

	inline function set_maxMotorTorque(value:Float):Float return Physics2DWheelJoint_Ffi.set_maxMotorTorque(this, value);
	public var motorImpulse(get, set):Float;

	inline function get_motorImpulse():Float return Physics2DWheelJoint_Ffi.get_motorImpulse(this);

	inline function set_motorImpulse(value:Float):Float return Physics2DWheelJoint_Ffi.set_motorImpulse(this, value);
	public var motorSpeed(get, set):Float;

	inline function get_motorSpeed():Float return Physics2DWheelJoint_Ffi.get_motorSpeed(this);

	inline function set_motorSpeed(value:Float):Float return Physics2DWheelJoint_Ffi.set_motorSpeed(this, value);
	public var restTranslation(get, set):Float;

	inline function get_restTranslation():Float return Physics2DWheelJoint_Ffi.get_restTranslation(this);

	inline function set_restTranslation(value:Float):Float return Physics2DWheelJoint_Ffi.set_restTranslation(this, value);
}
