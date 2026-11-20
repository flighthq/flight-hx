package flight._hl;

abstract Scene2DResourceFailureNotice(hl.Bytes) {
	public var total(get, set):Int;

	inline function get_total():Int return this.getI32(24);

	inline function set_total(value:Int):Int { this.setI32(24, value); return value; }
	public var unresolved(get, set):Int;

	inline function get_unresolved():Int return this.getI32(32);

	inline function set_unresolved(value:Int):Int { this.setI32(32, value); return value; }
}
