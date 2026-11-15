package flight._cpp;

private extern class Physics2DJointOptions_Ffi {
	@:native("flight_get_physics2_djoint_options_body_a") static function get_bodyA(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_physics2_djoint_options_body_a") static function set_bodyA(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_physics2_djoint_options_body_b") static function get_bodyB(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_physics2_djoint_options_body_b") static function set_bodyB(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract Physics2DJointOptions(cpp.Star<cpp.Void>) {
	public var bodyA(get, set):Int;

	inline function get_bodyA():Int return Physics2DJointOptions_Ffi.get_bodyA(this);

	inline function set_bodyA(value:Int):Int return Physics2DJointOptions_Ffi.set_bodyA(this, value);
	public var bodyB(get, set):Int;

	inline function get_bodyB():Int return Physics2DJointOptions_Ffi.get_bodyB(this);

	inline function set_bodyB(value:Int):Int return Physics2DJointOptions_Ffi.set_bodyB(this, value);
}
