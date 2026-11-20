package flight._hl;

abstract StorageMigration(hl.Bytes) {
	public var version(get, set):Int;

	inline function get_version():Int return this.getI32(16);

	inline function set_version(value:Int):Int { this.setI32(16, value); return value; }
}
