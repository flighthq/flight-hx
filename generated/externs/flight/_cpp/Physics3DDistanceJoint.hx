package flight._cpp;

private extern class Physics3DDistanceJoint_Ffi {
	@:native("flight_get_physics3_ddistance_joint_length") static function get_length(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_physics3_ddistance_joint_length") static function set_length(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_physics3_ddistance_joint_enable_spring") static function get_enableSpring(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_physics3_ddistance_joint_enable_spring") static function set_enableSpring(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_physics3_ddistance_joint_frequency_hz") static function get_frequencyHz(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_physics3_ddistance_joint_frequency_hz") static function set_frequencyHz(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_physics3_ddistance_joint_damping_ratio") static function get_dampingRatio(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_physics3_ddistance_joint_damping_ratio") static function set_dampingRatio(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_physics3_ddistance_joint_enable_limit") static function get_enableLimit(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_physics3_ddistance_joint_enable_limit") static function set_enableLimit(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_physics3_ddistance_joint_min_length") static function get_minLength(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_physics3_ddistance_joint_min_length") static function set_minLength(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_physics3_ddistance_joint_max_length") static function get_maxLength(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_physics3_ddistance_joint_max_length") static function set_maxLength(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_physics3_ddistance_joint_lower_limit_impulse") static function get_lowerLimitImpulse(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_physics3_ddistance_joint_lower_limit_impulse") static function set_lowerLimitImpulse(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_physics3_ddistance_joint_upper_limit_impulse") static function get_upperLimitImpulse(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_physics3_ddistance_joint_upper_limit_impulse") static function set_upperLimitImpulse(ptr:cpp.Star<cpp.Void>, value:Float):Float;
}

abstract Physics3DDistanceJoint(cpp.Star<cpp.Void>) {
	public var length(get, set):Float;

	inline function get_length():Float return Physics3DDistanceJoint_Ffi.get_length(this);

	inline function set_length(value:Float):Float { Physics3DDistanceJoint_Ffi.set_length(this, value); return value; }
	public var enableSpring(get, set):Bool;

	inline function get_enableSpring():Bool return Physics3DDistanceJoint_Ffi.get_enableSpring(this);

	inline function set_enableSpring(value:Bool):Bool { Physics3DDistanceJoint_Ffi.set_enableSpring(this, value); return value; }
	public var frequencyHz(get, set):Float;

	inline function get_frequencyHz():Float return Physics3DDistanceJoint_Ffi.get_frequencyHz(this);

	inline function set_frequencyHz(value:Float):Float { Physics3DDistanceJoint_Ffi.set_frequencyHz(this, value); return value; }
	public var dampingRatio(get, set):Float;

	inline function get_dampingRatio():Float return Physics3DDistanceJoint_Ffi.get_dampingRatio(this);

	inline function set_dampingRatio(value:Float):Float { Physics3DDistanceJoint_Ffi.set_dampingRatio(this, value); return value; }
	public var enableLimit(get, set):Bool;

	inline function get_enableLimit():Bool return Physics3DDistanceJoint_Ffi.get_enableLimit(this);

	inline function set_enableLimit(value:Bool):Bool { Physics3DDistanceJoint_Ffi.set_enableLimit(this, value); return value; }
	public var minLength(get, set):Float;

	inline function get_minLength():Float return Physics3DDistanceJoint_Ffi.get_minLength(this);

	inline function set_minLength(value:Float):Float { Physics3DDistanceJoint_Ffi.set_minLength(this, value); return value; }
	public var maxLength(get, set):Float;

	inline function get_maxLength():Float return Physics3DDistanceJoint_Ffi.get_maxLength(this);

	inline function set_maxLength(value:Float):Float { Physics3DDistanceJoint_Ffi.set_maxLength(this, value); return value; }
	public var lowerLimitImpulse(get, set):Float;

	inline function get_lowerLimitImpulse():Float return Physics3DDistanceJoint_Ffi.get_lowerLimitImpulse(this);

	inline function set_lowerLimitImpulse(value:Float):Float { Physics3DDistanceJoint_Ffi.set_lowerLimitImpulse(this, value); return value; }
	public var upperLimitImpulse(get, set):Float;

	inline function get_upperLimitImpulse():Float return Physics3DDistanceJoint_Ffi.get_upperLimitImpulse(this);

	inline function set_upperLimitImpulse(value:Float):Float { Physics3DDistanceJoint_Ffi.set_upperLimitImpulse(this, value); return value; }
}
