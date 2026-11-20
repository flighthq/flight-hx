package flight._hl;

abstract Awd2LightEntry(hl.Bytes) {
	public var key(get, set):Int;

	inline function get_key():Int return this.getI32(120);

	inline function set_key(value:Int):Int { this.setI32(120, value); return value; }
}
