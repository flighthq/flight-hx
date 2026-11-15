package flight._hl;

abstract TextSegmenterExplanation(hl.Bytes) {
	public var available(get, set):Bool;

	inline function get_available():Bool return this.getUI8(0) != 0;

	inline function set_available(value:Bool):Bool { this.setUI8(0, value ? 1 : 0); return value; }
	public var intlSegmenterAvailable(get, set):Bool;

	inline function get_intlSegmenterAvailable():Bool return this.getUI8(2) != 0;

	inline function set_intlSegmenterAvailable(value:Bool):Bool { this.setUI8(2, value ? 1 : 0); return value; }
}
