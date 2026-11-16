package flight._hl;

abstract SfntTableRange(hl.Bytes) {
	public var length(get, set):Int;

	inline function get_length():Int return this.getI32(0);

	inline function set_length(value:Int):Int { this.setI32(0, value); return value; }
	public var offset(get, set):Int;

	inline function get_offset():Int return this.getI32(8);

	inline function set_offset(value:Int):Int { this.setI32(8, value); return value; }
}
