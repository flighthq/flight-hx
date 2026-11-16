package flight._hl;

abstract ThreeDsChunkDispatchEntry(hl.Bytes) {
	public var chunkId(get, set):Int;

	inline function get_chunkId():Int return this.getUI16(8);

	inline function set_chunkId(value:Int):Int { this.setUI16(8, value); return value; }
}
