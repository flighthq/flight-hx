package flight._hl;

abstract Physics2DDebugGeometry(hl.Bytes) {
	public var circleCount(get, set):Int;

	inline function get_circleCount():Int return this.getI32(16);

	inline function set_circleCount(value:Int):Int { this.setI32(16, value); return value; }
	public var lineCount(get, set):Int;

	inline function get_lineCount():Int return this.getI32(48);

	inline function set_lineCount(value:Int):Int { this.setI32(48, value); return value; }
}
