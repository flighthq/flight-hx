package flight._cpp;

private extern class CffIndexEntry_Ffi {
	@:native("flight_get_cff_index_entry_end") static function get_end(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_cff_index_entry_end") static function set_end(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_cff_index_entry_start") static function get_start(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_cff_index_entry_start") static function set_start(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract CffIndexEntry(cpp.Star<cpp.Void>) {
	public var end(get, set):Int;

	inline function get_end():Int return CffIndexEntry_Ffi.get_end(this);

	inline function set_end(value:Int):Int { CffIndexEntry_Ffi.set_end(this, value); return value; }
	public var start(get, set):Int;

	inline function get_start():Int return CffIndexEntry_Ffi.get_start(this);

	inline function set_start(value:Int):Int { CffIndexEntry_Ffi.set_start(this, value); return value; }
}
