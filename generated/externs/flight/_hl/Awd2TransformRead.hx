package flight._hl;

abstract Awd2TransformRead(hl.Bytes) {
	public var end(get, set):Int;

	inline function get_end():Int return this.getI32(16);

	inline function set_end(value:Int):Int { this.setI32(16, value); return value; }
}
