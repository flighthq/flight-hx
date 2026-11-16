package flight._cpp;

private extern class Physics3DAbiExecutionResult_Ffi {
	@:native("flight_get_physics3_dabi_execution_result_byte_offset") static function get_byteOffset(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_physics3_dabi_execution_result_byte_offset") static function set_byteOffset(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_physics3_dabi_execution_result_command_index") static function get_commandIndex(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_physics3_dabi_execution_result_command_index") static function set_commandIndex(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_physics3_dabi_execution_result_command_kind") static function get_commandKind(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_physics3_dabi_execution_result_command_kind") static function set_commandKind(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract Physics3DAbiExecutionResult(cpp.Star<cpp.Void>) {
	public var byteOffset(get, set):Int;

	inline function get_byteOffset():Int return Physics3DAbiExecutionResult_Ffi.get_byteOffset(this);

	inline function set_byteOffset(value:Int):Int { Physics3DAbiExecutionResult_Ffi.set_byteOffset(this, value); return value; }
	public var commandIndex(get, set):Int;

	inline function get_commandIndex():Int return Physics3DAbiExecutionResult_Ffi.get_commandIndex(this);

	inline function set_commandIndex(value:Int):Int { Physics3DAbiExecutionResult_Ffi.set_commandIndex(this, value); return value; }
	public var commandKind(get, set):Int;

	inline function get_commandKind():Int return Physics3DAbiExecutionResult_Ffi.get_commandKind(this);

	inline function set_commandKind(value:Int):Int { Physics3DAbiExecutionResult_Ffi.set_commandKind(this, value); return value; }
}
