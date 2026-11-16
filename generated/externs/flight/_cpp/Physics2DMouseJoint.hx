package flight._cpp;

private extern class Physics2DMouseJoint_Ffi {
	@:native("flight_get_physics2_dmouse_joint_damping_ratio") static function get_dampingRatio(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics2_dmouse_joint_damping_ratio") static function set_dampingRatio(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics2_dmouse_joint_frequency_hz") static function get_frequencyHz(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics2_dmouse_joint_frequency_hz") static function set_frequencyHz(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics2_dmouse_joint_max_force") static function get_maxForce(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics2_dmouse_joint_max_force") static function set_maxForce(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics2_dmouse_joint_target_x") static function get_targetX(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics2_dmouse_joint_target_x") static function set_targetX(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics2_dmouse_joint_target_y") static function get_targetY(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics2_dmouse_joint_target_y") static function set_targetY(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract Physics2DMouseJoint(cpp.Star<cpp.Void>) {
	public var dampingRatio(get, set):Single;

	inline function get_dampingRatio():Single return Physics2DMouseJoint_Ffi.get_dampingRatio(this);

	inline function set_dampingRatio(value:Single):Single { Physics2DMouseJoint_Ffi.set_dampingRatio(this, value); return value; }
	public var frequencyHz(get, set):Single;

	inline function get_frequencyHz():Single return Physics2DMouseJoint_Ffi.get_frequencyHz(this);

	inline function set_frequencyHz(value:Single):Single { Physics2DMouseJoint_Ffi.set_frequencyHz(this, value); return value; }
	public var maxForce(get, set):Single;

	inline function get_maxForce():Single return Physics2DMouseJoint_Ffi.get_maxForce(this);

	inline function set_maxForce(value:Single):Single { Physics2DMouseJoint_Ffi.set_maxForce(this, value); return value; }
	public var targetX(get, set):Single;

	inline function get_targetX():Single return Physics2DMouseJoint_Ffi.get_targetX(this);

	inline function set_targetX(value:Single):Single { Physics2DMouseJoint_Ffi.set_targetX(this, value); return value; }
	public var targetY(get, set):Single;

	inline function get_targetY():Single return Physics2DMouseJoint_Ffi.get_targetY(this);

	inline function set_targetY(value:Single):Single { Physics2DMouseJoint_Ffi.set_targetY(this, value); return value; }
}
