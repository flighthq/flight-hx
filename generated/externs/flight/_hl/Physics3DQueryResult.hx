package flight._hl;

abstract Physics3DQueryResult(hl.Bytes) {
	public var hitCount(get, set):Int;

	inline function get_hitCount():Int return this.getI32(40);

	inline function set_hitCount(value:Int):Int { this.setI32(40, value); return value; }
}
