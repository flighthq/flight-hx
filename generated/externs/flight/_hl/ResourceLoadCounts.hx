package flight._hl;

abstract ResourceLoadCounts(hl.Bytes) {
	public var settledItems(get, set):Int;

	inline function get_settledItems():Int return this.getI32(0);

	inline function set_settledItems(value:Int):Int { this.setI32(0, value); return value; }
	public var inFlightItems(get, set):Int;

	inline function get_inFlightItems():Int return this.getI32(8);

	inline function set_inFlightItems(value:Int):Int { this.setI32(8, value); return value; }
	public var queuedItems(get, set):Int;

	inline function get_queuedItems():Int return this.getI32(16);

	inline function set_queuedItems(value:Int):Int { this.setI32(16, value); return value; }
	public var totalItems(get, set):Int;

	inline function get_totalItems():Int return this.getI32(24);

	inline function set_totalItems(value:Int):Int { this.setI32(24, value); return value; }
}
