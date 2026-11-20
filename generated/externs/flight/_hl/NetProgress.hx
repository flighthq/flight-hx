package flight._hl;

abstract NetProgress(hl.Bytes) {
	public var loaded(get, set):Int;

	inline function get_loaded():Int return this.getI32(0);

	inline function set_loaded(value:Int):Int { this.setI32(0, value); return value; }
	public var total(get, set):Int;

	inline function get_total():Int return this.getI32(8);

	inline function set_total(value:Int):Int { this.setI32(8, value); return value; }
}
