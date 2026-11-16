package flight._js;

abstract Physics2DAbiCommandBuffer(Dynamic) {
	public var byteLength(get, set):Int;
	inline function get_byteLength():Int return untyped this.byteLength;
	inline function set_byteLength(value:Int):Int return untyped this.byteLength = value;
	public var commandCount(get, set):Int;
	inline function get_commandCount():Int return untyped this.commandCount;
	inline function set_commandCount(value:Int):Int return untyped this.commandCount = value;
}
