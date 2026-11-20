package flight._hl;

abstract FocusManager(hl.Bytes) {
	public var wrap(get, set):Bool;

	inline function get_wrap():Bool return this.getUI8(32) != 0;

	inline function set_wrap(value:Bool):Bool { this.setUI8(32, value ? 1 : 0); return value; }
}
