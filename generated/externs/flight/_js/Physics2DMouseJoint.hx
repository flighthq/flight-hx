package flight._js;

@:jsRequire("flight")
private extern class Physics2DMouseJoint_Ffi {
	@:native("flight_get_physics2_dmouse_joint_damping_ratio") static function get_dampingRatio(ptr:Dynamic):Float;
	@:native("flight_set_physics2_dmouse_joint_damping_ratio") static function set_dampingRatio(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_physics2_dmouse_joint_frequency_hz") static function get_frequencyHz(ptr:Dynamic):Float;
	@:native("flight_set_physics2_dmouse_joint_frequency_hz") static function set_frequencyHz(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_physics2_dmouse_joint_max_force") static function get_maxForce(ptr:Dynamic):Float;
	@:native("flight_set_physics2_dmouse_joint_max_force") static function set_maxForce(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_physics2_dmouse_joint_target_x") static function get_targetX(ptr:Dynamic):Float;
	@:native("flight_set_physics2_dmouse_joint_target_x") static function set_targetX(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_physics2_dmouse_joint_target_y") static function get_targetY(ptr:Dynamic):Float;
	@:native("flight_set_physics2_dmouse_joint_target_y") static function set_targetY(ptr:Dynamic, value:Float):Float;
}

abstract Physics2DMouseJoint(Dynamic) {
	public var dampingRatio(get, set):Float;

	inline function get_dampingRatio():Float return Physics2DMouseJoint_Ffi.get_dampingRatio(this);

	inline function set_dampingRatio(value:Float):Float return Physics2DMouseJoint_Ffi.set_dampingRatio(this, value);
	public var frequencyHz(get, set):Float;

	inline function get_frequencyHz():Float return Physics2DMouseJoint_Ffi.get_frequencyHz(this);

	inline function set_frequencyHz(value:Float):Float return Physics2DMouseJoint_Ffi.set_frequencyHz(this, value);
	public var maxForce(get, set):Float;

	inline function get_maxForce():Float return Physics2DMouseJoint_Ffi.get_maxForce(this);

	inline function set_maxForce(value:Float):Float return Physics2DMouseJoint_Ffi.set_maxForce(this, value);
	public var targetX(get, set):Float;

	inline function get_targetX():Float return Physics2DMouseJoint_Ffi.get_targetX(this);

	inline function set_targetX(value:Float):Float return Physics2DMouseJoint_Ffi.set_targetX(this, value);
	public var targetY(get, set):Float;

	inline function get_targetY():Float return Physics2DMouseJoint_Ffi.get_targetY(this);

	inline function set_targetY(value:Float):Float return Physics2DMouseJoint_Ffi.set_targetY(this, value);
}
