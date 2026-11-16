package flight._hl;

abstract ThreeDsChunkCount(hl.Bytes) {
	public var chunkId(get, set):Int;

	inline function get_chunkId():Int return this.getUI16(8);

	inline function set_chunkId(value:Int):Int { this.setUI16(8, value); return value; }
	public var count(get, set):Int;

	inline function get_count():Int return this.getI32(0);

	inline function set_count(value:Int):Int { this.setI32(0, value); return value; }
}
