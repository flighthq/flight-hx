package flight._cpp;

private extern class FileStat_Ffi {
	@:native("flight_get_file_stat_size") static function get_size(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_file_stat_size") static function set_size(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_file_stat_is_directory") static function get_isDirectory(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_file_stat_is_directory") static function set_isDirectory(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_file_stat_modified_time") static function get_modifiedTime(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_file_stat_modified_time") static function set_modifiedTime(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_file_stat_created_time") static function get_createdTime(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_file_stat_created_time") static function set_createdTime(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_file_stat_is_symlink") static function get_isSymlink(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_file_stat_is_symlink") static function set_isSymlink(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
}

abstract FileStat(cpp.Star<cpp.Void>) {
	public var size(get, set):Int;

	inline function get_size():Int return FileStat_Ffi.get_size(this);

	inline function set_size(value:Int):Int { FileStat_Ffi.set_size(this, value); return value; }
	public var isDirectory(get, set):Bool;

	inline function get_isDirectory():Bool return FileStat_Ffi.get_isDirectory(this);

	inline function set_isDirectory(value:Bool):Bool { FileStat_Ffi.set_isDirectory(this, value); return value; }
	public var modifiedTime(get, set):Float;

	inline function get_modifiedTime():Float return FileStat_Ffi.get_modifiedTime(this);

	inline function set_modifiedTime(value:Float):Float { FileStat_Ffi.set_modifiedTime(this, value); return value; }
	public var createdTime(get, set):Float;

	inline function get_createdTime():Float return FileStat_Ffi.get_createdTime(this);

	inline function set_createdTime(value:Float):Float { FileStat_Ffi.set_createdTime(this, value); return value; }
	public var isSymlink(get, set):Bool;

	inline function get_isSymlink():Bool return FileStat_Ffi.get_isSymlink(this);

	inline function set_isSymlink(value:Bool):Bool { FileStat_Ffi.set_isSymlink(this, value); return value; }
}
