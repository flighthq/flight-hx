package flight._hl;

abstract BitmapReadbackExplanation(hl.Bytes) {
	public var readable(get, set):Bool;

	inline function get_readable():Bool return this.getUI8(0) != 0;

	inline function set_readable(value:Bool):Bool { this.setUI8(0, value ? 1 : 0); return value; }
}
