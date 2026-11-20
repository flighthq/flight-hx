package flight._hl;

abstract Scene2DResourceCoverageCount(hl.Bytes) {
	public var resolved(get, set):Int;

	inline function get_resolved():Int return this.getI32(0);

	inline function set_resolved(value:Int):Int { this.setI32(0, value); return value; }
	public var total(get, set):Int;

	inline function get_total():Int return this.getI32(8);

	inline function set_total(value:Int):Int { this.setI32(8, value); return value; }
}
