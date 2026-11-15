package flight._cpp;

private extern class Physics2DGearJointOptions_Ffi {
	@:native("flight_get_physics2_dgear_joint_options_constant") static function get_constant(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics2_dgear_joint_options_constant") static function set_constant(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract Physics2DGearJointOptions(cpp.Star<cpp.Void>) {
	public var constant(get, set):Single;

	inline function get_constant():Single return Physics2DGearJointOptions_Ffi.get_constant(this);

	inline function set_constant(value:Single):Single return Physics2DGearJointOptions_Ffi.set_constant(this, value);
}
