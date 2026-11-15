package flight._hl;

abstract VideoResource(hl.Bytes) {
	public var ownsElement(get, set):Bool;

	inline function get_ownsElement():Bool return this.getUI8(48) != 0;

	inline function set_ownsElement(value:Bool):Bool { this.setUI8(48, value ? 1 : 0); return value; }
}
