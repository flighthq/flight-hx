package flight._cpp;

private extern class Woff2TableDirectory_Ffi {
	@:native("flight_get_woff2_table_directory_stream_start") static function get_streamStart(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_woff2_table_directory_stream_start") static function set_streamStart(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_woff2_table_directory_total_uncompressed_length") static function get_totalUncompressedLength(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_woff2_table_directory_total_uncompressed_length") static function set_totalUncompressedLength(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract Woff2TableDirectory(cpp.Star<cpp.Void>) {
	public var streamStart(get, set):Int;

	inline function get_streamStart():Int return Woff2TableDirectory_Ffi.get_streamStart(this);

	inline function set_streamStart(value:Int):Int { Woff2TableDirectory_Ffi.set_streamStart(this, value); return value; }
	public var totalUncompressedLength(get, set):Int;

	inline function get_totalUncompressedLength():Int return Woff2TableDirectory_Ffi.get_totalUncompressedLength(this);

	inline function set_totalUncompressedLength(value:Int):Int { Woff2TableDirectory_Ffi.set_totalUncompressedLength(this, value); return value; }
}
