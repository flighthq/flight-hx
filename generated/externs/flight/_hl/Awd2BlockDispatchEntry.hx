package flight._hl;

abstract Awd2BlockDispatchEntry(hl.Bytes) {
	public var blockType(get, set):Int;

	inline function get_blockType():Int return this.getUI8(8);

	inline function set_blockType(value:Int):Int { this.setUI8(8, value); return value; }
}
