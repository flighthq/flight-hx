package flight._cpp;

private extern class Awd2BlockDispatchEntry_Ffi {
	@:native("flight_get_awd2_block_dispatch_entry_block_type") static function get_blockType(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_awd2_block_dispatch_entry_block_type") static function set_blockType(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract Awd2BlockDispatchEntry(cpp.Star<cpp.Void>) {
	public var blockType(get, set):Int;

	inline function get_blockType():Int return Awd2BlockDispatchEntry_Ffi.get_blockType(this);

	inline function set_blockType(value:Int):Int { Awd2BlockDispatchEntry_Ffi.set_blockType(this, value); return value; }
}
