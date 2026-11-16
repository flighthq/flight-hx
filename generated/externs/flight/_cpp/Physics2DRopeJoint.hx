package flight._cpp;

private extern class Physics2DRopeJoint_Ffi {
	@:native("flight_get_physics2_drope_joint_max_length") static function get_maxLength(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics2_drope_joint_max_length") static function set_maxLength(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract Physics2DRopeJoint(cpp.Star<cpp.Void>) {
	public var maxLength(get, set):Single;

	inline function get_maxLength():Single return Physics2DRopeJoint_Ffi.get_maxLength(this);

	inline function set_maxLength(value:Single):Single { Physics2DRopeJoint_Ffi.set_maxLength(this, value); return value; }
}
