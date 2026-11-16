package flight._cpp;

private extern class ThreeDsChunkCount_Ffi {
	@:native("flight_get_three_ds_chunk_count_chunk_id") static function get_chunkId(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_three_ds_chunk_count_chunk_id") static function set_chunkId(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_three_ds_chunk_count_count") static function get_count(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_three_ds_chunk_count_count") static function set_count(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract ThreeDsChunkCount(cpp.Star<cpp.Void>) {
	public var chunkId(get, set):Int;

	inline function get_chunkId():Int return ThreeDsChunkCount_Ffi.get_chunkId(this);

	inline function set_chunkId(value:Int):Int { ThreeDsChunkCount_Ffi.set_chunkId(this, value); return value; }
	public var count(get, set):Int;

	inline function get_count():Int return ThreeDsChunkCount_Ffi.get_count(this);

	inline function set_count(value:Int):Int { ThreeDsChunkCount_Ffi.set_count(this, value); return value; }
}
