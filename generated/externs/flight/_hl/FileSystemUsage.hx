package flight._hl;

abstract FileSystemUsage(hl.Bytes) {
	public var usedBytes(get, set):Int;

	inline function get_usedBytes():Int return this.getI32(0);

	inline function set_usedBytes(value:Int):Int { this.setI32(0, value); return value; }
	public var quotaBytes(get, set):Int;

	inline function get_quotaBytes():Int return this.getI32(8);

	inline function set_quotaBytes(value:Int):Int { this.setI32(8, value); return value; }
}
