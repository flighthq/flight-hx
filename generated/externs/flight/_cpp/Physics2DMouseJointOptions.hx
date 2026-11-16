package flight._cpp;

private extern class Physics2DMouseJointOptions_Ffi {
	@:native("flight_get_physics2_dmouse_joint_options_body") static function get_body(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_physics2_dmouse_joint_options_body") static function set_body(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_physics2_dmouse_joint_options_max_force") static function get_maxForce(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics2_dmouse_joint_options_max_force") static function set_maxForce(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics2_dmouse_joint_options_target_x") static function get_targetX(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics2_dmouse_joint_options_target_x") static function set_targetX(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics2_dmouse_joint_options_target_y") static function get_targetY(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics2_dmouse_joint_options_target_y") static function set_targetY(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract Physics2DMouseJointOptions(cpp.Star<cpp.Void>) {
	public var body(get, set):Int;

	inline function get_body():Int return Physics2DMouseJointOptions_Ffi.get_body(this);

	inline function set_body(value:Int):Int { Physics2DMouseJointOptions_Ffi.set_body(this, value); return value; }
	public var maxForce(get, set):Single;

	inline function get_maxForce():Single return Physics2DMouseJointOptions_Ffi.get_maxForce(this);

	inline function set_maxForce(value:Single):Single { Physics2DMouseJointOptions_Ffi.set_maxForce(this, value); return value; }
	public var targetX(get, set):Single;

	inline function get_targetX():Single return Physics2DMouseJointOptions_Ffi.get_targetX(this);

	inline function set_targetX(value:Single):Single { Physics2DMouseJointOptions_Ffi.set_targetX(this, value); return value; }
	public var targetY(get, set):Single;

	inline function get_targetY():Single return Physics2DMouseJointOptions_Ffi.get_targetY(this);

	inline function set_targetY(value:Single):Single { Physics2DMouseJointOptions_Ffi.set_targetY(this, value); return value; }
}
