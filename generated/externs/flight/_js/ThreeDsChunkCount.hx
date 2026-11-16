package flight._js;

abstract ThreeDsChunkCount(Dynamic) {
	public var chunkId(get, set):Int;
	inline function get_chunkId():Int return untyped this["chunkId"];
	inline function set_chunkId(value:Int):Int return untyped this["chunkId"] = value;
	public var count(get, set):Int;
	inline function get_count():Int return untyped this["count"];
	inline function set_count(value:Int):Int return untyped this["count"] = value;
}
