package flight._cpp;

private extern class Physics2DDistanceJointOptions_Ffi {
	@:native("flight_get_physics2_ddistance_joint_options_length") static function get_length(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics2_ddistance_joint_options_length") static function set_length(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract Physics2DDistanceJointOptions(cpp.Star<cpp.Void>) {
	public var length(get, set):Single;

	inline function get_length():Single return Physics2DDistanceJointOptions_Ffi.get_length(this);

	inline function set_length(value:Single):Single return Physics2DDistanceJointOptions_Ffi.set_length(this, value);
}
