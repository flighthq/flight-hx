package flight._js;

abstract Physics2DAbiExecutionResult(Dynamic) {
	public var byteOffset(get, set):Int;
	inline function get_byteOffset():Int return untyped this["byteOffset"];
	inline function set_byteOffset(value:Int):Int return untyped this["byteOffset"] = value;
	public var commandIndex(get, set):Int;
	inline function get_commandIndex():Int return untyped this["commandIndex"];
	inline function set_commandIndex(value:Int):Int return untyped this["commandIndex"] = value;
	public var commandKind(get, set):Int;
	inline function get_commandKind():Int return untyped this["commandKind"];
	inline function set_commandKind(value:Int):Int return untyped this["commandKind"] = value;
}
