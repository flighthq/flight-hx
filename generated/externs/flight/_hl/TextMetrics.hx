package flight._hl;

abstract TextMetrics(hl.Bytes) {
	public var height(get, set):Single;

	inline function get_height():Single return this.getF32(24);

	inline function set_height(value:Single):Single { this.setF32(24, value); return value; }
	public var numLines(get, set):Int;

	inline function get_numLines():Int return this.getI32(16);

	inline function set_numLines(value:Int):Int { this.setI32(16, value); return value; }
	public var width(get, set):Single;

	inline function get_width():Single return this.getF32(28);

	inline function set_width(value:Single):Single { this.setF32(28, value); return value; }
}
