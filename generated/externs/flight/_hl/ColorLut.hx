package flight._hl;

abstract ColorLut(hl.Bytes) {
	public var size(get, set):Int;

	inline function get_size():Int return this.getI32(0);

	inline function set_size(value:Int):Int { this.setI32(0, value); return value; }
}
