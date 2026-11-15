package flight._hl;

abstract Physics3DAbiCommandBuffer(hl.Bytes) {
	public var byteLength(get, set):Int;

	inline function get_byteLength():Int return this.getI32(16);

	inline function set_byteLength(value:Int):Int { this.setI32(16, value); return value; }
	public var commandCount(get, set):Int;

	inline function get_commandCount():Int return this.getI32(24);

	inline function set_commandCount(value:Int):Int { this.setI32(24, value); return value; }
}
