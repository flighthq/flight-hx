package flight._hl;

abstract DeviceCapabilities(hl.Bytes) {
	public var hasKeyboard(get, set):Bool;

	inline function get_hasKeyboard():Bool return this.getUI8(0) != 0;

	inline function set_hasKeyboard(value:Bool):Bool { this.setUI8(0, value ? 1 : 0); return value; }
	public var hasMouse(get, set):Bool;

	inline function get_hasMouse():Bool return this.getUI8(1) != 0;

	inline function set_hasMouse(value:Bool):Bool { this.setUI8(1, value ? 1 : 0); return value; }
	public var hasStylus(get, set):Bool;

	inline function get_hasStylus():Bool return this.getUI8(2) != 0;

	inline function set_hasStylus(value:Bool):Bool { this.setUI8(2, value ? 1 : 0); return value; }
}
