package flight._hl;

abstract ClipRegion(hl.Bytes) {
	public var version(get, set):Int;

	inline function get_version():Int return this.getI32(76);

	inline function set_version(value:Int):Int { this.setI32(76, value); return value; }
}
