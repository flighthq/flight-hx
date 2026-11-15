package flight._hl;

abstract CameraGuardState(hl.Bytes) {
	public var enabled(get, set):Bool;

	inline function get_enabled():Bool return this.getUI8(0) != 0;

	inline function set_enabled(value:Bool):Bool { this.setUI8(0, value ? 1 : 0); return value; }
}
