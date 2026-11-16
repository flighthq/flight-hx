package flight._cpp;

private extern class Physics2DAbiCommandBuffer_Ffi {
	@:native("flight_get_physics2_dabi_command_buffer_byte_length") static function get_byteLength(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_physics2_dabi_command_buffer_byte_length") static function set_byteLength(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_physics2_dabi_command_buffer_command_count") static function get_commandCount(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_physics2_dabi_command_buffer_command_count") static function set_commandCount(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract Physics2DAbiCommandBuffer(cpp.Star<cpp.Void>) {
	public var byteLength(get, set):Int;

	inline function get_byteLength():Int return Physics2DAbiCommandBuffer_Ffi.get_byteLength(this);

	inline function set_byteLength(value:Int):Int { Physics2DAbiCommandBuffer_Ffi.set_byteLength(this, value); return value; }
	public var commandCount(get, set):Int;

	inline function get_commandCount():Int return Physics2DAbiCommandBuffer_Ffi.get_commandCount(this);

	inline function set_commandCount(value:Int):Int { Physics2DAbiCommandBuffer_Ffi.set_commandCount(this, value); return value; }
}
