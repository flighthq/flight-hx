package flight._cpp;

private extern class Physics2DAbiJointBuffer_Ffi {
	@:native("flight_get_physics2_dabi_joint_buffer_count") static function get_count(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_physics2_dabi_joint_buffer_count") static function set_count(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_physics2_dabi_joint_buffer_required_count") static function get_requiredCount(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_physics2_dabi_joint_buffer_required_count") static function set_requiredCount(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract Physics2DAbiJointBuffer(cpp.Star<cpp.Void>) {
	public var count(get, set):Int;

	inline function get_count():Int return Physics2DAbiJointBuffer_Ffi.get_count(this);

	inline function set_count(value:Int):Int return Physics2DAbiJointBuffer_Ffi.set_count(this, value);
	public var requiredCount(get, set):Int;

	inline function get_requiredCount():Int return Physics2DAbiJointBuffer_Ffi.get_requiredCount(this);

	inline function set_requiredCount(value:Int):Int return Physics2DAbiJointBuffer_Ffi.set_requiredCount(this, value);
}
