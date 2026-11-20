package flight._js;

abstract StorageMigrationCheckpointFailed(Dynamic) {
	public var failedVersion(get, set):Int;
	inline function get_failedVersion():Int return untyped this.failedVersion;
	inline function set_failedVersion(value:Int):Int return untyped this.failedVersion = value;
	public var version(get, set):Int;
	inline function get_version():Int return untyped this.version;
	inline function set_version(value:Int):Int return untyped this.version = value;
}
