package flight._hl;

abstract NodeOrderList(hl.Bytes) {
	public var entryCount(get, set):Int;

	inline function get_entryCount():Int return this.getI32(16);

	inline function set_entryCount(value:Int):Int { this.setI32(16, value); return value; }
}
