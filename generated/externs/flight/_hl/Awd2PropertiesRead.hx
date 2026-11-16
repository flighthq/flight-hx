package flight._hl;

abstract Awd2PropertiesRead(hl.Bytes) {
	public var end(get, set):Int;

	inline function get_end():Int return this.getI32(24);

	inline function set_end(value:Int):Int { this.setI32(24, value); return value; }
}
