package flight._hl;

abstract Woff2TableDirectory(hl.Bytes) {
	public var streamStart(get, set):Int;

	inline function get_streamStart():Int return this.getI32(24);

	inline function set_streamStart(value:Int):Int { this.setI32(24, value); return value; }
	public var totalUncompressedLength(get, set):Int;

	inline function get_totalUncompressedLength():Int return this.getI32(32);

	inline function set_totalUncompressedLength(value:Int):Int { this.setI32(32, value); return value; }
}
