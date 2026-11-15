package flight._js;

@:jsRequire("flight")
private extern class Physics2DMouseJointOptions_Ffi {
	@:native("flight_get_physics2_dmouse_joint_options_body") static function get_body(ptr:Dynamic):Int;
	@:native("flight_set_physics2_dmouse_joint_options_body") static function set_body(ptr:Dynamic, value:Int):Int;
	@:native("flight_get_physics2_dmouse_joint_options_max_force") static function get_maxForce(ptr:Dynamic):Float;
	@:native("flight_set_physics2_dmouse_joint_options_max_force") static function set_maxForce(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_physics2_dmouse_joint_options_target_x") static function get_targetX(ptr:Dynamic):Float;
	@:native("flight_set_physics2_dmouse_joint_options_target_x") static function set_targetX(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_physics2_dmouse_joint_options_target_y") static function get_targetY(ptr:Dynamic):Float;
	@:native("flight_set_physics2_dmouse_joint_options_target_y") static function set_targetY(ptr:Dynamic, value:Float):Float;
}

abstract Physics2DMouseJointOptions(Dynamic) {
	public var body(get, set):Int;

	inline function get_body():Int return Physics2DMouseJointOptions_Ffi.get_body(this);

	inline function set_body(value:Int):Int return Physics2DMouseJointOptions_Ffi.set_body(this, value);
	public var maxForce(get, set):Float;

	inline function get_maxForce():Float return Physics2DMouseJointOptions_Ffi.get_maxForce(this);

	inline function set_maxForce(value:Float):Float return Physics2DMouseJointOptions_Ffi.set_maxForce(this, value);
	public var targetX(get, set):Float;

	inline function get_targetX():Float return Physics2DMouseJointOptions_Ffi.get_targetX(this);

	inline function set_targetX(value:Float):Float return Physics2DMouseJointOptions_Ffi.set_targetX(this, value);
	public var targetY(get, set):Float;

	inline function get_targetY():Float return Physics2DMouseJointOptions_Ffi.get_targetY(this);

	inline function set_targetY(value:Float):Float return Physics2DMouseJointOptions_Ffi.set_targetY(this, value);
}
