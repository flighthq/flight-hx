package flight._hl;

abstract ClipRegionExplanation(hl.Bytes) {
	public var conservative(get, set):Bool;

	inline function get_conservative():Bool return this.getUI8(0) != 0;

	inline function set_conservative(value:Bool):Bool { this.setUI8(0, value ? 1 : 0); return value; }
}
