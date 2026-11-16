package flight._hl;

abstract Scene3DGuardState(hl.Bytes) {
	public var enabled(get, set):Bool;

	inline function get_enabled():Bool return this.getUI8(16) != 0;

	inline function set_enabled(value:Bool):Bool { this.setUI8(16, value ? 1 : 0); return value; }
}
