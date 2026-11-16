package flight._hl;

abstract Physics3DGuardState(hl.Bytes) {
	public var enabled(get, set):Bool;

	inline function get_enabled():Bool return this.getUI8(64) != 0;

	inline function set_enabled(value:Bool):Bool { this.setUI8(64, value ? 1 : 0); return value; }
}
