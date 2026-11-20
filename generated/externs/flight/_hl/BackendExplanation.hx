package flight._hl;

abstract BackendExplanation(hl.Bytes) {
	public var conflict(get, set):Bool;

	inline function get_conflict():Bool return this.getUI8(32) != 0;

	inline function set_conflict(value:Bool):Bool { this.setUI8(32, value ? 1 : 0); return value; }
}
