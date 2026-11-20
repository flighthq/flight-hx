package flight._cpp;

private extern class Physics2DDistanceJoint_Ffi {
	@:native("flight_get_physics2_ddistance_joint_damping_ratio") static function get_dampingRatio(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_physics2_ddistance_joint_damping_ratio") static function set_dampingRatio(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_physics2_ddistance_joint_frequency_hz") static function get_frequencyHz(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_physics2_ddistance_joint_frequency_hz") static function set_frequencyHz(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_physics2_ddistance_joint_length") static function get_length(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_physics2_ddistance_joint_length") static function set_length(ptr:cpp.Star<cpp.Void>, value:Float):Float;
}

abstract Physics2DDistanceJoint(cpp.Star<cpp.Void>) {
	public var dampingRatio(get, set):Float;

	inline function get_dampingRatio():Float return Physics2DDistanceJoint_Ffi.get_dampingRatio(this);

	inline function set_dampingRatio(value:Float):Float { Physics2DDistanceJoint_Ffi.set_dampingRatio(this, value); return value; }
	public var frequencyHz(get, set):Float;

	inline function get_frequencyHz():Float return Physics2DDistanceJoint_Ffi.get_frequencyHz(this);

	inline function set_frequencyHz(value:Float):Float { Physics2DDistanceJoint_Ffi.set_frequencyHz(this, value); return value; }
	public var length(get, set):Float;

	inline function get_length():Float return Physics2DDistanceJoint_Ffi.get_length(this);

	inline function set_length(value:Float):Float { Physics2DDistanceJoint_Ffi.set_length(this, value); return value; }
}
