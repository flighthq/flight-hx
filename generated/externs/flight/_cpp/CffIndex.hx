package flight._cpp;

private extern class CffIndex_Ffi {
	@:native("flight_get_cff_index_end_offset") static function get_endOffset(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_cff_index_end_offset") static function set_endOffset(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract CffIndex(cpp.Star<cpp.Void>) {
	public var endOffset(get, set):Int;

	inline function get_endOffset():Int return CffIndex_Ffi.get_endOffset(this);

	inline function set_endOffset(value:Int):Int { CffIndex_Ffi.set_endOffset(this, value); return value; }
}
