package flight._hl;

abstract Awd2NodeIndexEntry(hl.Bytes) {
	public var key(get, set):Int;

	inline function get_key():Int return this.getI32(0);

	inline function set_key(value:Int):Int { this.setI32(0, value); return value; }
	public var value(get, set):Int;

	inline function get_value():Int return this.getI32(4);

	inline function set_value(value:Int):Int { this.setI32(4, value); return value; }
}
