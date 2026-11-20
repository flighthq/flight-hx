package flight._hl;

abstract StorageMigrationOk(hl.Bytes) {
	public var version(get, set):Int;

	inline function get_version():Int return this.getI32(0);

	inline function set_version(value:Int):Int { this.setI32(0, value); return value; }
}
