package flight._hl;

abstract ShareResult(hl.Bytes) {
	public var completed(get, set):Bool;

	inline function get_completed():Bool return this.getUI8(24) != 0;

	inline function set_completed(value:Bool):Bool { this.setUI8(24, value ? 1 : 0); return value; }
	public var dismissed(get, set):Bool;

	inline function get_dismissed():Bool return this.getUI8(25) != 0;

	inline function set_dismissed(value:Bool):Bool { this.setUI8(25, value ? 1 : 0); return value; }
}
