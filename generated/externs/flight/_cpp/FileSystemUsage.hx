package flight._cpp;

private extern class FileSystemUsage_Ffi {
	@:native("flight_get_file_system_usage_used_bytes") static function get_usedBytes(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_file_system_usage_used_bytes") static function set_usedBytes(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_file_system_usage_quota_bytes") static function get_quotaBytes(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_file_system_usage_quota_bytes") static function set_quotaBytes(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract FileSystemUsage(cpp.Star<cpp.Void>) {
	public var usedBytes(get, set):Int;

	inline function get_usedBytes():Int return FileSystemUsage_Ffi.get_usedBytes(this);

	inline function set_usedBytes(value:Int):Int { FileSystemUsage_Ffi.set_usedBytes(this, value); return value; }
	public var quotaBytes(get, set):Int;

	inline function get_quotaBytes():Int return FileSystemUsage_Ffi.get_quotaBytes(this);

	inline function set_quotaBytes(value:Int):Int { FileSystemUsage_Ffi.set_quotaBytes(this, value); return value; }
}
