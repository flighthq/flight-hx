package flight._cpp;

private extern class ThreeDsChunkDispatchEntry_Ffi {
	@:native("flight_get_three_ds_chunk_dispatch_entry_chunk_id") static function get_chunkId(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_three_ds_chunk_dispatch_entry_chunk_id") static function set_chunkId(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract ThreeDsChunkDispatchEntry(cpp.Star<cpp.Void>) {
	public var chunkId(get, set):Int;

	inline function get_chunkId():Int return ThreeDsChunkDispatchEntry_Ffi.get_chunkId(this);

	inline function set_chunkId(value:Int):Int { ThreeDsChunkDispatchEntry_Ffi.set_chunkId(this, value); return value; }
}
