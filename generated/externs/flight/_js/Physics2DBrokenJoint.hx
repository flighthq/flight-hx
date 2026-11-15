package flight._js;

@:jsRequire("flight")
private extern class Physics2DBrokenJoint_Ffi {
	@:native("flight_get_physics2_dbroken_joint_force_x") static function get_forceX(ptr:Dynamic):Float;
	@:native("flight_set_physics2_dbroken_joint_force_x") static function set_forceX(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_physics2_dbroken_joint_force_y") static function get_forceY(ptr:Dynamic):Float;
	@:native("flight_set_physics2_dbroken_joint_force_y") static function set_forceY(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_physics2_dbroken_joint_torque") static function get_torque(ptr:Dynamic):Float;
	@:native("flight_set_physics2_dbroken_joint_torque") static function set_torque(ptr:Dynamic, value:Float):Float;
}

abstract Physics2DBrokenJoint(Dynamic) {
	public var forceX(get, set):Float;

	inline function get_forceX():Float return Physics2DBrokenJoint_Ffi.get_forceX(this);

	inline function set_forceX(value:Float):Float return Physics2DBrokenJoint_Ffi.set_forceX(this, value);
	public var forceY(get, set):Float;

	inline function get_forceY():Float return Physics2DBrokenJoint_Ffi.get_forceY(this);

	inline function set_forceY(value:Float):Float return Physics2DBrokenJoint_Ffi.set_forceY(this, value);
	public var torque(get, set):Float;

	inline function get_torque():Float return Physics2DBrokenJoint_Ffi.get_torque(this);

	inline function set_torque(value:Float):Float return Physics2DBrokenJoint_Ffi.set_torque(this, value);
}
