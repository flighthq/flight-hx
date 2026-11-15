package flight._js;

@:jsRequire("flight")
private extern class Physics3DAbiBodyBuffer_Ffi {
	@:native("flight_get_physics3_dabi_body_buffer_count") static function get_count(ptr:Dynamic):Int;
	@:native("flight_set_physics3_dabi_body_buffer_count") static function set_count(ptr:Dynamic, value:Int):Int;
	@:native("flight_get_physics3_dabi_body_buffer_required_count") static function get_requiredCount(ptr:Dynamic):Int;
	@:native("flight_set_physics3_dabi_body_buffer_required_count") static function set_requiredCount(ptr:Dynamic, value:Int):Int;
}

abstract Physics3DAbiBodyBuffer(Dynamic) {
	public var count(get, set):Int;

	inline function get_count():Int return Physics3DAbiBodyBuffer_Ffi.get_count(this);

	inline function set_count(value:Int):Int return Physics3DAbiBodyBuffer_Ffi.set_count(this, value);
	public var requiredCount(get, set):Int;

	inline function get_requiredCount():Int return Physics3DAbiBodyBuffer_Ffi.get_requiredCount(this);

	inline function set_requiredCount(value:Int):Int return Physics3DAbiBodyBuffer_Ffi.set_requiredCount(this, value);
}
