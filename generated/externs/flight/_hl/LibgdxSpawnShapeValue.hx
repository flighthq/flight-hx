package flight._hl;

abstract LibgdxSpawnShapeValue(hl.Bytes) {
	public var edges(get, set):Bool;

	inline function get_edges():Bool return this.getUI8(0) != 0;

	inline function set_edges(value:Bool):Bool { this.setUI8(0, value ? 1 : 0); return value; }
}
