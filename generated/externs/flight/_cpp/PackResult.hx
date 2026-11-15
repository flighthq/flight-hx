package flight._cpp;

private extern class PackResult_Ffi {
	@:native("flight_get_pack_result_width") static function get_width(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_pack_result_width") static function set_width(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_pack_result_height") static function get_height(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_pack_result_height") static function set_height(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract PackResult(cpp.Star<cpp.Void>) {
	public var width(get, set):Single;

	inline function get_width():Single return PackResult_Ffi.get_width(this);

	inline function set_width(value:Single):Single return PackResult_Ffi.set_width(this, value);
	public var height(get, set):Single;

	inline function get_height():Single return PackResult_Ffi.get_height(this);

	inline function set_height(value:Single):Single return PackResult_Ffi.set_height(this, value);
}
