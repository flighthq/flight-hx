package flight._js;

@:jsRequire("flight")
private extern class Physics2DDistanceJoint_Ffi {
	@:native("flight_get_physics2_ddistance_joint_damping_ratio") static function get_dampingRatio(ptr:Dynamic):Float;
	@:native("flight_set_physics2_ddistance_joint_damping_ratio") static function set_dampingRatio(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_physics2_ddistance_joint_frequency_hz") static function get_frequencyHz(ptr:Dynamic):Float;
	@:native("flight_set_physics2_ddistance_joint_frequency_hz") static function set_frequencyHz(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_physics2_ddistance_joint_length") static function get_length(ptr:Dynamic):Float;
	@:native("flight_set_physics2_ddistance_joint_length") static function set_length(ptr:Dynamic, value:Float):Float;
}

abstract Physics2DDistanceJoint(Dynamic) {
	public var dampingRatio(get, set):Float;

	inline function get_dampingRatio():Float return Physics2DDistanceJoint_Ffi.get_dampingRatio(this);

	inline function set_dampingRatio(value:Float):Float return Physics2DDistanceJoint_Ffi.set_dampingRatio(this, value);
	public var frequencyHz(get, set):Float;

	inline function get_frequencyHz():Float return Physics2DDistanceJoint_Ffi.get_frequencyHz(this);

	inline function set_frequencyHz(value:Float):Float return Physics2DDistanceJoint_Ffi.set_frequencyHz(this, value);
	public var length(get, set):Float;

	inline function get_length():Float return Physics2DDistanceJoint_Ffi.get_length(this);

	inline function set_length(value:Float):Float return Physics2DDistanceJoint_Ffi.set_length(this, value);
}
