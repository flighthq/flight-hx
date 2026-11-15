package flight._hl;

abstract Physics3DAbi(hl.Bytes) {
	public var capabilities(get, set):Int;

	inline function get_capabilities():Int return this.getI32(16);

	inline function set_capabilities(value:Int):Int { this.setI32(16, value); return value; }
	public var version(get, set):Int;

	inline function get_version():Int return this.getI32(216);

	inline function set_version(value:Int):Int { this.setI32(216, value); return value; }
}
