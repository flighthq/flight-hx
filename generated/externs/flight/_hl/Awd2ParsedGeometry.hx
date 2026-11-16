package flight._hl;

abstract Awd2ParsedGeometry(hl.Bytes) {
	public var skinned(get, set):Bool;

	inline function get_skinned():Bool return this.getUI8(8) != 0;

	inline function set_skinned(value:Bool):Bool { this.setUI8(8, value ? 1 : 0); return value; }
}
