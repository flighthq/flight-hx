package flight._cpp;

private extern class AbcFile_Ffi {
	@:native("flight_get_abc_file_major_version") static function get_majorVersion(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_abc_file_major_version") static function set_majorVersion(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_abc_file_minor_version") static function get_minorVersion(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_abc_file_minor_version") static function set_minorVersion(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract AbcFile(cpp.Star<cpp.Void>) {
	public var majorVersion(get, set):Int;

	inline function get_majorVersion():Int return AbcFile_Ffi.get_majorVersion(this);

	inline function set_majorVersion(value:Int):Int { AbcFile_Ffi.set_majorVersion(this, value); return value; }
	public var minorVersion(get, set):Int;

	inline function get_minorVersion():Int return AbcFile_Ffi.get_minorVersion(this);

	inline function set_minorVersion(value:Int):Int { AbcFile_Ffi.set_minorVersion(this, value); return value; }
}
