package flight._hl;

abstract Scene2DAudioResourceLoadProgress(hl.Bytes) {
	public var loaded(get, set):Int;

	inline function get_loaded():Int return this.getI32(16);

	inline function set_loaded(value:Int):Int { this.setI32(16, value); return value; }
	public var total(get, set):Int;

	inline function get_total():Int return this.getI32(24);

	inline function set_total(value:Int):Int { this.setI32(24, value); return value; }
}
