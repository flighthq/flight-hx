package flight._cpp;

private extern class StorageMigrationCheckpointFailed_Ffi {
	@:native("flight_get_storage_migration_checkpoint_failed_failed_version") static function get_failedVersion(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_storage_migration_checkpoint_failed_failed_version") static function set_failedVersion(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_storage_migration_checkpoint_failed_version") static function get_version(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_storage_migration_checkpoint_failed_version") static function set_version(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract StorageMigrationCheckpointFailed(cpp.Star<cpp.Void>) {
	public var failedVersion(get, set):Int;

	inline function get_failedVersion():Int return StorageMigrationCheckpointFailed_Ffi.get_failedVersion(this);

	inline function set_failedVersion(value:Int):Int { StorageMigrationCheckpointFailed_Ffi.set_failedVersion(this, value); return value; }
	public var version(get, set):Int;

	inline function get_version():Int return StorageMigrationCheckpointFailed_Ffi.get_version(this);

	inline function set_version(value:Int):Int { StorageMigrationCheckpointFailed_Ffi.set_version(this, value); return value; }
}
