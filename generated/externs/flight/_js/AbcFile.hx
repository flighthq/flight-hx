package flight._js;

@:jsRequire("flight")
private extern class AbcFile_Ffi {
	@:native("flight_get_abc_file_major_version") static function get_majorVersion(ptr:Dynamic):Int;
	@:native("flight_set_abc_file_major_version") static function set_majorVersion(ptr:Dynamic, value:Int):Int;
	@:native("flight_get_abc_file_minor_version") static function get_minorVersion(ptr:Dynamic):Int;
	@:native("flight_set_abc_file_minor_version") static function set_minorVersion(ptr:Dynamic, value:Int):Int;
}

abstract AbcFile(Dynamic) {
	public var majorVersion(get, set):Int;

	inline function get_majorVersion():Int return AbcFile_Ffi.get_majorVersion(this);

	inline function set_majorVersion(value:Int):Int return AbcFile_Ffi.set_majorVersion(this, value);
	public var minorVersion(get, set):Int;

	inline function get_minorVersion():Int return AbcFile_Ffi.get_minorVersion(this);

	inline function set_minorVersion(value:Int):Int return AbcFile_Ffi.set_minorVersion(this, value);
}
