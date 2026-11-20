package flight._hl;

private extern class Physics2DWheelJoint_Ffi {
	@:hlNative("flight", "flight_get_physics2_dwheel_joint_damping_ratio")
	static function get_dampingRatio(ptr:hl.Bytes):Float;
	@:hlNative("flight", "flight_set_physics2_dwheel_joint_damping_ratio")
	static function set_dampingRatio(ptr:hl.Bytes, value:Float):Float;
	@:hlNative("flight", "flight_get_physics2_dwheel_joint_enable_motor")
	static function get_enableMotor(ptr:hl.Bytes):Bool;
	@:hlNative("flight", "flight_set_physics2_dwheel_joint_enable_motor")
	static function set_enableMotor(ptr:hl.Bytes, value:Bool):Bool;
	@:hlNative("flight", "flight_get_physics2_dwheel_joint_frequency_hz")
	static function get_frequencyHz(ptr:hl.Bytes):Float;
	@:hlNative("flight", "flight_set_physics2_dwheel_joint_frequency_hz")
	static function set_frequencyHz(ptr:hl.Bytes, value:Float):Float;
	@:hlNative("flight", "flight_get_physics2_dwheel_joint_local_axis_ax")
	static function get_localAxisAx(ptr:hl.Bytes):Float;
	@:hlNative("flight", "flight_set_physics2_dwheel_joint_local_axis_ax")
	static function set_localAxisAx(ptr:hl.Bytes, value:Float):Float;
	@:hlNative("flight", "flight_get_physics2_dwheel_joint_local_axis_ay")
	static function get_localAxisAy(ptr:hl.Bytes):Float;
	@:hlNative("flight", "flight_set_physics2_dwheel_joint_local_axis_ay")
	static function set_localAxisAy(ptr:hl.Bytes, value:Float):Float;
	@:hlNative("flight", "flight_get_physics2_dwheel_joint_max_motor_torque")
	static function get_maxMotorTorque(ptr:hl.Bytes):Float;
	@:hlNative("flight", "flight_set_physics2_dwheel_joint_max_motor_torque")
	static function set_maxMotorTorque(ptr:hl.Bytes, value:Float):Float;
	@:hlNative("flight", "flight_get_physics2_dwheel_joint_motor_impulse")
	static function get_motorImpulse(ptr:hl.Bytes):Float;
	@:hlNative("flight", "flight_set_physics2_dwheel_joint_motor_impulse")
	static function set_motorImpulse(ptr:hl.Bytes, value:Float):Float;
	@:hlNative("flight", "flight_get_physics2_dwheel_joint_motor_speed")
	static function get_motorSpeed(ptr:hl.Bytes):Float;
	@:hlNative("flight", "flight_set_physics2_dwheel_joint_motor_speed")
	static function set_motorSpeed(ptr:hl.Bytes, value:Float):Float;
	@:hlNative("flight", "flight_get_physics2_dwheel_joint_rest_translation")
	static function get_restTranslation(ptr:hl.Bytes):Float;
	@:hlNative("flight", "flight_set_physics2_dwheel_joint_rest_translation")
	static function set_restTranslation(ptr:hl.Bytes, value:Float):Float;
}

abstract Physics2DWheelJoint(hl.Bytes) {
	public var dampingRatio(get, set):Float;

	inline function get_dampingRatio():Float return Physics2DWheelJoint_Ffi.get_dampingRatio(this);

	inline function set_dampingRatio(value:Float):Float { Physics2DWheelJoint_Ffi.set_dampingRatio(this, value); return value; }
	public var enableMotor(get, set):Bool;

	inline function get_enableMotor():Bool return Physics2DWheelJoint_Ffi.get_enableMotor(this);

	inline function set_enableMotor(value:Bool):Bool { Physics2DWheelJoint_Ffi.set_enableMotor(this, value); return value; }
	public var frequencyHz(get, set):Float;

	inline function get_frequencyHz():Float return Physics2DWheelJoint_Ffi.get_frequencyHz(this);

	inline function set_frequencyHz(value:Float):Float { Physics2DWheelJoint_Ffi.set_frequencyHz(this, value); return value; }
	public var localAxisAx(get, set):Float;

	inline function get_localAxisAx():Float return Physics2DWheelJoint_Ffi.get_localAxisAx(this);

	inline function set_localAxisAx(value:Float):Float { Physics2DWheelJoint_Ffi.set_localAxisAx(this, value); return value; }
	public var localAxisAy(get, set):Float;

	inline function get_localAxisAy():Float return Physics2DWheelJoint_Ffi.get_localAxisAy(this);

	inline function set_localAxisAy(value:Float):Float { Physics2DWheelJoint_Ffi.set_localAxisAy(this, value); return value; }
	public var maxMotorTorque(get, set):Float;

	inline function get_maxMotorTorque():Float return Physics2DWheelJoint_Ffi.get_maxMotorTorque(this);

	inline function set_maxMotorTorque(value:Float):Float { Physics2DWheelJoint_Ffi.set_maxMotorTorque(this, value); return value; }
	public var motorImpulse(get, set):Float;

	inline function get_motorImpulse():Float return Physics2DWheelJoint_Ffi.get_motorImpulse(this);

	inline function set_motorImpulse(value:Float):Float { Physics2DWheelJoint_Ffi.set_motorImpulse(this, value); return value; }
	public var motorSpeed(get, set):Float;

	inline function get_motorSpeed():Float return Physics2DWheelJoint_Ffi.get_motorSpeed(this);

	inline function set_motorSpeed(value:Float):Float { Physics2DWheelJoint_Ffi.set_motorSpeed(this, value); return value; }
	public var restTranslation(get, set):Float;

	inline function get_restTranslation():Float return Physics2DWheelJoint_Ffi.get_restTranslation(this);

	inline function set_restTranslation(value:Float):Float { Physics2DWheelJoint_Ffi.set_restTranslation(this, value); return value; }
}
