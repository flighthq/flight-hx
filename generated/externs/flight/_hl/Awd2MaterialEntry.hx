package flight._hl;

abstract Awd2MaterialEntry(hl.Bytes) {
	public var key(get, set):Int;

	inline function get_key():Int return this.getI32(80);

	inline function set_key(value:Int):Int { this.setI32(80, value); return value; }
}
