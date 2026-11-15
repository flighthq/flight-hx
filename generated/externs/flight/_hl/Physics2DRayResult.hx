package flight._hl;

abstract Physics2DRayResult(hl.Bytes) {
	public var hitCount(get, set):Int;

	inline function get_hitCount():Int return this.getI32(16);

	inline function set_hitCount(value:Int):Int { this.setI32(16, value); return value; }
}
