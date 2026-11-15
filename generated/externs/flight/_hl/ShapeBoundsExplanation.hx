package flight._hl;

abstract ShapeBoundsExplanation(hl.Bytes) {
	public var complete(get, set):Bool;

	inline function get_complete():Bool return this.getUI8(0) != 0;

	inline function set_complete(value:Bool):Bool { this.setUI8(0, value ? 1 : 0); return value; }
}
