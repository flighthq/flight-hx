package flight._cpp;

private extern class Physics2DDistanceJoint_Ffi {
	@:native("flight_get_physics2_ddistance_joint_damping_ratio") static function get_dampingRatio(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics2_ddistance_joint_damping_ratio") static function set_dampingRatio(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics2_ddistance_joint_frequency_hz") static function get_frequencyHz(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics2_ddistance_joint_frequency_hz") static function set_frequencyHz(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics2_ddistance_joint_length") static function get_length(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics2_ddistance_joint_length") static function set_length(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract Physics2DDistanceJoint(cpp.Star<cpp.Void>) {
	public var dampingRatio(get, set):Single;

	inline function get_dampingRatio():Single return Physics2DDistanceJoint_Ffi.get_dampingRatio(this);

	inline function set_dampingRatio(value:Single):Single { Physics2DDistanceJoint_Ffi.set_dampingRatio(this, value); return value; }
	public var frequencyHz(get, set):Single;

	inline function get_frequencyHz():Single return Physics2DDistanceJoint_Ffi.get_frequencyHz(this);

	inline function set_frequencyHz(value:Single):Single { Physics2DDistanceJoint_Ffi.set_frequencyHz(this, value); return value; }
	public var length(get, set):Single;

	inline function get_length():Single return Physics2DDistanceJoint_Ffi.get_length(this);

	inline function set_length(value:Single):Single { Physics2DDistanceJoint_Ffi.set_length(this, value); return value; }
}
