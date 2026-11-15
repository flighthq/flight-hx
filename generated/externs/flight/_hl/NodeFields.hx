package flight._hl;

abstract NodeFields(hl.Bytes) {
	public var enabled(get, set):Bool;

	inline function get_enabled():Bool return this.getUI8(384) != 0;

	inline function set_enabled(value:Bool):Bool { this.setUI8(384, value ? 1 : 0); return value; }
}
