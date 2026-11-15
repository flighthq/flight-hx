package flight._js;

@:jsRequire("flight")
private extern class Physics3DAbiCommandBuffer_Ffi {
	@:native("flight_get_physics3_dabi_command_buffer_byte_length") static function get_byteLength(ptr:Dynamic):Int;
	@:native("flight_set_physics3_dabi_command_buffer_byte_length") static function set_byteLength(ptr:Dynamic, value:Int):Int;
	@:native("flight_get_physics3_dabi_command_buffer_command_count") static function get_commandCount(ptr:Dynamic):Int;
	@:native("flight_set_physics3_dabi_command_buffer_command_count") static function set_commandCount(ptr:Dynamic, value:Int):Int;
}

abstract Physics3DAbiCommandBuffer(Dynamic) {
	public var byteLength(get, set):Int;

	inline function get_byteLength():Int return Physics3DAbiCommandBuffer_Ffi.get_byteLength(this);

	inline function set_byteLength(value:Int):Int return Physics3DAbiCommandBuffer_Ffi.set_byteLength(this, value);
	public var commandCount(get, set):Int;

	inline function get_commandCount():Int return Physics3DAbiCommandBuffer_Ffi.get_commandCount(this);

	inline function set_commandCount(value:Int):Int return Physics3DAbiCommandBuffer_Ffi.set_commandCount(this, value);
}
