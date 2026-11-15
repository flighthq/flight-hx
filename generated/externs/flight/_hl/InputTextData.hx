package flight._hl;

abstract InputTextData(hl.Bytes) {
	public var isComposing(get, set):Bool;

	inline function get_isComposing():Bool return this.getUI8(0) != 0;

	inline function set_isComposing(value:Bool):Bool { this.setUI8(0, value ? 1 : 0); return value; }
}
