package flight._hl;

abstract Woff2Cursor(hl.Bytes) {
	public var at(get, set):Int;

	inline function get_at():Int return this.getI32(0);

	inline function set_at(value:Int):Int { this.setI32(0, value); return value; }
}
