package flight._hl;

abstract TextSegment(hl.Bytes) {
	public var start(get, set):Int;

	inline function get_start():Int return this.getI32(0);

	inline function set_start(value:Int):Int { this.setI32(0, value); return value; }
	public var end(get, set):Int;

	inline function get_end():Int return this.getI32(8);

	inline function set_end(value:Int):Int { this.setI32(8, value); return value; }
}
