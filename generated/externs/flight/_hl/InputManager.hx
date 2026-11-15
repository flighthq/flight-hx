package flight._hl;

abstract InputManager(hl.Bytes) {
	public var enabled(get, set):Bool;

	inline function get_enabled():Bool return this.getUI8(296) != 0;

	inline function set_enabled(value:Bool):Bool { this.setUI8(296, value ? 1 : 0); return value; }
}
