package flight._hl;

abstract CommandDispatchExplanation(hl.Bytes) {
	public var resolved(get, set):Bool;

	inline function get_resolved():Bool return this.getUI8(24) != 0;

	inline function set_resolved(value:Bool):Bool { this.setUI8(24, value ? 1 : 0); return value; }
}
