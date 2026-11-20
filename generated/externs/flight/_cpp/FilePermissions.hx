package flight._cpp;

private extern class FilePermissions_Ffi {
	@:native("flight_get_file_permissions_readable") static function get_readable(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_file_permissions_readable") static function set_readable(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_file_permissions_writable") static function get_writable(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_file_permissions_writable") static function set_writable(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_file_permissions_executable") static function get_executable(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_file_permissions_executable") static function set_executable(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
}

abstract FilePermissions(cpp.Star<cpp.Void>) {
	public var readable(get, set):Bool;

	inline function get_readable():Bool return FilePermissions_Ffi.get_readable(this);

	inline function set_readable(value:Bool):Bool { FilePermissions_Ffi.set_readable(this, value); return value; }
	public var writable(get, set):Bool;

	inline function get_writable():Bool return FilePermissions_Ffi.get_writable(this);

	inline function set_writable(value:Bool):Bool { FilePermissions_Ffi.set_writable(this, value); return value; }
	public var executable(get, set):Bool;

	inline function get_executable():Bool return FilePermissions_Ffi.get_executable(this);

	inline function set_executable(value:Bool):Bool { FilePermissions_Ffi.set_executable(this, value); return value; }
}
