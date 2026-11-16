package flight._cpp;

private extern class SfntTableDirectory_Ffi {
	@:native("flight_get_sfnt_table_directory_declared_table_count") static function get_declaredTableCount(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_sfnt_table_directory_declared_table_count") static function set_declaredTableCount(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_sfnt_table_directory_sfnt_version") static function get_sfntVersion(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_sfnt_table_directory_sfnt_version") static function set_sfntVersion(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract SfntTableDirectory(cpp.Star<cpp.Void>) {
	public var declaredTableCount(get, set):Int;

	inline function get_declaredTableCount():Int return SfntTableDirectory_Ffi.get_declaredTableCount(this);

	inline function set_declaredTableCount(value:Int):Int { SfntTableDirectory_Ffi.set_declaredTableCount(this, value); return value; }
	public var sfntVersion(get, set):Int;

	inline function get_sfntVersion():Int return SfntTableDirectory_Ffi.get_sfntVersion(this);

	inline function set_sfntVersion(value:Int):Int { SfntTableDirectory_Ffi.set_sfntVersion(this, value); return value; }
}
