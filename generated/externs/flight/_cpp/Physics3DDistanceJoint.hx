package flight._cpp;

private extern class Physics3DDistanceJoint_Ffi {
	@:native("flight_get_physics3_ddistance_joint_length") static function get_length(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics3_ddistance_joint_length") static function set_length(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics3_ddistance_joint_enable_spring") static function get_enableSpring(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_physics3_ddistance_joint_enable_spring") static function set_enableSpring(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_physics3_ddistance_joint_frequency_hz") static function get_frequencyHz(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics3_ddistance_joint_frequency_hz") static function set_frequencyHz(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics3_ddistance_joint_damping_ratio") static function get_dampingRatio(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics3_ddistance_joint_damping_ratio") static function set_dampingRatio(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics3_ddistance_joint_enable_limit") static function get_enableLimit(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_physics3_ddistance_joint_enable_limit") static function set_enableLimit(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_physics3_ddistance_joint_min_length") static function get_minLength(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics3_ddistance_joint_min_length") static function set_minLength(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics3_ddistance_joint_max_length") static function get_maxLength(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics3_ddistance_joint_max_length") static function set_maxLength(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics3_ddistance_joint_lower_limit_impulse") static function get_lowerLimitImpulse(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics3_ddistance_joint_lower_limit_impulse") static function set_lowerLimitImpulse(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics3_ddistance_joint_upper_limit_impulse") static function get_upperLimitImpulse(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics3_ddistance_joint_upper_limit_impulse") static function set_upperLimitImpulse(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract Physics3DDistanceJoint(cpp.Star<cpp.Void>) {
	public var length(get, set):Single;

	inline function get_length():Single return Physics3DDistanceJoint_Ffi.get_length(this);

	inline function set_length(value:Single):Single { Physics3DDistanceJoint_Ffi.set_length(this, value); return value; }
	public var enableSpring(get, set):Bool;

	inline function get_enableSpring():Bool return Physics3DDistanceJoint_Ffi.get_enableSpring(this);

	inline function set_enableSpring(value:Bool):Bool { Physics3DDistanceJoint_Ffi.set_enableSpring(this, value); return value; }
	public var frequencyHz(get, set):Single;

	inline function get_frequencyHz():Single return Physics3DDistanceJoint_Ffi.get_frequencyHz(this);

	inline function set_frequencyHz(value:Single):Single { Physics3DDistanceJoint_Ffi.set_frequencyHz(this, value); return value; }
	public var dampingRatio(get, set):Single;

	inline function get_dampingRatio():Single return Physics3DDistanceJoint_Ffi.get_dampingRatio(this);

	inline function set_dampingRatio(value:Single):Single { Physics3DDistanceJoint_Ffi.set_dampingRatio(this, value); return value; }
	public var enableLimit(get, set):Bool;

	inline function get_enableLimit():Bool return Physics3DDistanceJoint_Ffi.get_enableLimit(this);

	inline function set_enableLimit(value:Bool):Bool { Physics3DDistanceJoint_Ffi.set_enableLimit(this, value); return value; }
	public var minLength(get, set):Single;

	inline function get_minLength():Single return Physics3DDistanceJoint_Ffi.get_minLength(this);

	inline function set_minLength(value:Single):Single { Physics3DDistanceJoint_Ffi.set_minLength(this, value); return value; }
	public var maxLength(get, set):Single;

	inline function get_maxLength():Single return Physics3DDistanceJoint_Ffi.get_maxLength(this);

	inline function set_maxLength(value:Single):Single { Physics3DDistanceJoint_Ffi.set_maxLength(this, value); return value; }
	public var lowerLimitImpulse(get, set):Single;

	inline function get_lowerLimitImpulse():Single return Physics3DDistanceJoint_Ffi.get_lowerLimitImpulse(this);

	inline function set_lowerLimitImpulse(value:Single):Single { Physics3DDistanceJoint_Ffi.set_lowerLimitImpulse(this, value); return value; }
	public var upperLimitImpulse(get, set):Single;

	inline function get_upperLimitImpulse():Single return Physics3DDistanceJoint_Ffi.get_upperLimitImpulse(this);

	inline function set_upperLimitImpulse(value:Single):Single { Physics3DDistanceJoint_Ffi.set_upperLimitImpulse(this, value); return value; }
}
