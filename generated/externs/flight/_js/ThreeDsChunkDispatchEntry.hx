package flight._js;

abstract ThreeDsChunkDispatchEntry(Dynamic) {
	public var chunkId(get, set):Int;
	inline function get_chunkId():Int return untyped this.chunkId;
	inline function set_chunkId(value:Int):Int return untyped this.chunkId = value;
}
