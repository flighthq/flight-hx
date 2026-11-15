package flight._js;

@:jsRequire("flight")
private extern class Physics2DGearJointOptions_Ffi {
	@:native("flight_get_physics2_dgear_joint_options_constant") static function get_constant(ptr:Dynamic):Float;
	@:native("flight_set_physics2_dgear_joint_options_constant") static function set_constant(ptr:Dynamic, value:Float):Float;
}

abstract Physics2DGearJointOptions(Dynamic) {
	public var constant(get, set):Float;

	inline function get_constant():Float return Physics2DGearJointOptions_Ffi.get_constant(this);

	inline function set_constant(value:Float):Float return Physics2DGearJointOptions_Ffi.set_constant(this, value);
}
