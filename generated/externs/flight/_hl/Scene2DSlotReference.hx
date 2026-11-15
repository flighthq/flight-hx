package flight._hl;

abstract Scene2DSlotReference(hl.Bytes) {
	public var required(get, set):Bool;

	inline function get_required():Bool return this.getUI8(80) != 0;

	inline function set_required(value:Bool):Bool { this.setUI8(80, value ? 1 : 0); return value; }
}
