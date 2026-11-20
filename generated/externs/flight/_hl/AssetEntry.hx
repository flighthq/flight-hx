package flight._hl;

abstract AssetEntry(hl.Bytes) {
	public var refcount(get, set):Int;

	inline function get_refcount():Int return this.getI32(48);

	inline function set_refcount(value:Int):Int { this.setI32(48, value); return value; }
	public var resident(get, set):Bool;

	inline function get_resident():Bool return this.getUI8(56) != 0;

	inline function set_resident(value:Bool):Bool { this.setUI8(56, value ? 1 : 0); return value; }
}
