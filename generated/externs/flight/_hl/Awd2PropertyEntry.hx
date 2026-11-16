package flight._hl;

abstract Awd2PropertyEntry(hl.Bytes) {
	public var key(get, set):Int;

	inline function get_key():Int return this.getUI16(16);

	inline function set_key(value:Int):Int { this.setUI16(16, value); return value; }
}
