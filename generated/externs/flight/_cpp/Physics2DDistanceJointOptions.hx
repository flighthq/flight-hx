package flight._cpp;

private extern class Physics2DDistanceJointOptions_Ffi {
	@:native("flight_get_physics2_ddistance_joint_options_length") static function get_length(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_physics2_ddistance_joint_options_length") static function set_length(ptr:cpp.Star<cpp.Void>, value:Float):Float;
}

abstract Physics2DDistanceJointOptions(cpp.Star<cpp.Void>) {
	public var length(get, set):Float;

	inline function get_length():Float return Physics2DDistanceJointOptions_Ffi.get_length(this);

	inline function set_length(value:Float):Float { Physics2DDistanceJointOptions_Ffi.set_length(this, value); return value; }
}
