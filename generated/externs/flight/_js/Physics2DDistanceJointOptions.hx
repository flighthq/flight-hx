package flight._js;

@:jsRequire("flight")
private extern class Physics2DDistanceJointOptions_Ffi {
	@:native("flight_get_physics2_ddistance_joint_options_length") static function get_length(ptr:Dynamic):Float;
	@:native("flight_set_physics2_ddistance_joint_options_length") static function set_length(ptr:Dynamic, value:Float):Float;
}

abstract Physics2DDistanceJointOptions(Dynamic) {
	public var length(get, set):Float;

	inline function get_length():Float return Physics2DDistanceJointOptions_Ffi.get_length(this);

	inline function set_length(value:Float):Float return Physics2DDistanceJointOptions_Ffi.set_length(this, value);
}
