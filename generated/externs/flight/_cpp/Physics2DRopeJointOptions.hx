package flight._cpp;

private extern class Physics2DRopeJointOptions_Ffi {
	@:native("flight_get_physics2_drope_joint_options_max_length") static function get_maxLength(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_physics2_drope_joint_options_max_length") static function set_maxLength(ptr:cpp.Star<cpp.Void>, value:Float):Float;
}

abstract Physics2DRopeJointOptions(cpp.Star<cpp.Void>) {
	public var maxLength(get, set):Float;

	inline function get_maxLength():Float return Physics2DRopeJointOptions_Ffi.get_maxLength(this);

	inline function set_maxLength(value:Float):Float { Physics2DRopeJointOptions_Ffi.set_maxLength(this, value); return value; }
}
