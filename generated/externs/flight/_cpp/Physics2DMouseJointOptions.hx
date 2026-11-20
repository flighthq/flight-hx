package flight._cpp;

private extern class Physics2DMouseJointOptions_Ffi {
	@:native("flight_get_physics2_dmouse_joint_options_body") static function get_body(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_physics2_dmouse_joint_options_body") static function set_body(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_physics2_dmouse_joint_options_max_force") static function get_maxForce(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_physics2_dmouse_joint_options_max_force") static function set_maxForce(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_physics2_dmouse_joint_options_target_x") static function get_targetX(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_physics2_dmouse_joint_options_target_x") static function set_targetX(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_physics2_dmouse_joint_options_target_y") static function get_targetY(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_physics2_dmouse_joint_options_target_y") static function set_targetY(ptr:cpp.Star<cpp.Void>, value:Float):Float;
}

abstract Physics2DMouseJointOptions(cpp.Star<cpp.Void>) {
	public var body(get, set):Int;

	inline function get_body():Int return Physics2DMouseJointOptions_Ffi.get_body(this);

	inline function set_body(value:Int):Int { Physics2DMouseJointOptions_Ffi.set_body(this, value); return value; }
	public var maxForce(get, set):Float;

	inline function get_maxForce():Float return Physics2DMouseJointOptions_Ffi.get_maxForce(this);

	inline function set_maxForce(value:Float):Float { Physics2DMouseJointOptions_Ffi.set_maxForce(this, value); return value; }
	public var targetX(get, set):Float;

	inline function get_targetX():Float return Physics2DMouseJointOptions_Ffi.get_targetX(this);

	inline function set_targetX(value:Float):Float { Physics2DMouseJointOptions_Ffi.set_targetX(this, value); return value; }
	public var targetY(get, set):Float;

	inline function get_targetY():Float return Physics2DMouseJointOptions_Ffi.get_targetY(this);

	inline function set_targetY(value:Float):Float { Physics2DMouseJointOptions_Ffi.set_targetY(this, value); return value; }
}
