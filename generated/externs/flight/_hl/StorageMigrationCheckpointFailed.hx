package flight._hl;

abstract StorageMigrationCheckpointFailed(hl.Bytes) {
	public var failedVersion(get, set):Int;

	inline function get_failedVersion():Int return this.getI32(4);

	inline function set_failedVersion(value:Int):Int { this.setI32(4, value); return value; }
	public var version(get, set):Int;

	inline function get_version():Int return this.getI32(8);

	inline function set_version(value:Int):Int { this.setI32(8, value); return value; }
}
