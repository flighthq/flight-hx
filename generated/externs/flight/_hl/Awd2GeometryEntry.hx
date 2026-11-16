package flight._hl;

abstract Awd2GeometryEntry(hl.Bytes) {
	public var key(get, set):Int;

	inline function get_key():Int return this.getI32(24);

	inline function set_key(value:Int):Int { this.setI32(24, value); return value; }
}
