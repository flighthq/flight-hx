package flight._hl;

abstract Scene2DResourceCoverageExplanation(hl.Bytes) {
	public var complete(get, set):Bool;

	inline function get_complete():Bool return this.getUI8(48) != 0;

	inline function set_complete(value:Bool):Bool { this.setUI8(48, value ? 1 : 0); return value; }
}
