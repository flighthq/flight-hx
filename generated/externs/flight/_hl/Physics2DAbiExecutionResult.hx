package flight._hl;

abstract Physics2DAbiExecutionResult(hl.Bytes) {
	public var byteOffset(get, set):Int;

	inline function get_byteOffset():Int return this.getI32(16);

	inline function set_byteOffset(value:Int):Int { this.setI32(16, value); return value; }
	public var commandIndex(get, set):Int;

	inline function get_commandIndex():Int return this.getI32(24);

	inline function set_commandIndex(value:Int):Int { this.setI32(24, value); return value; }
	public var commandKind(get, set):Int;

	inline function get_commandKind():Int return this.getI32(28);

	inline function set_commandKind(value:Int):Int { this.setI32(28, value); return value; }
}
