package flight._cpp;

private extern class Physics2DBrokenJoint_Ffi {
	@:native("flight_get_physics2_dbroken_joint_force_x") static function get_forceX(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics2_dbroken_joint_force_x") static function set_forceX(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics2_dbroken_joint_force_y") static function get_forceY(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics2_dbroken_joint_force_y") static function set_forceY(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics2_dbroken_joint_torque") static function get_torque(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics2_dbroken_joint_torque") static function set_torque(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract Physics2DBrokenJoint(cpp.Star<cpp.Void>) {
	public var forceX(get, set):Single;

	inline function get_forceX():Single return Physics2DBrokenJoint_Ffi.get_forceX(this);

	inline function set_forceX(value:Single):Single return Physics2DBrokenJoint_Ffi.set_forceX(this, value);
	public var forceY(get, set):Single;

	inline function get_forceY():Single return Physics2DBrokenJoint_Ffi.get_forceY(this);

	inline function set_forceY(value:Single):Single return Physics2DBrokenJoint_Ffi.set_forceY(this, value);
	public var torque(get, set):Single;

	inline function get_torque():Single return Physics2DBrokenJoint_Ffi.get_torque(this);

	inline function set_torque(value:Single):Single return Physics2DBrokenJoint_Ffi.set_torque(this, value);
}
