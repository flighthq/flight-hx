package flight._cpp;

private extern class StorageMigrationOk_Ffi {
	@:native("flight_get_storage_migration_ok_version") static function get_version(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_storage_migration_ok_version") static function set_version(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract StorageMigrationOk(cpp.Star<cpp.Void>) {
	public var version(get, set):Int;

	inline function get_version():Int return StorageMigrationOk_Ffi.get_version(this);

	inline function set_version(value:Int):Int { StorageMigrationOk_Ffi.set_version(this, value); return value; }
}
