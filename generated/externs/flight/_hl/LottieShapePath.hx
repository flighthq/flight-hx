package flight._hl;

abstract LottieShapePath(hl.Bytes) {
	public var c(get, set):Bool;

	inline function get_c():Bool return this.getUI8(0) != 0;

	inline function set_c(value:Bool):Bool { this.setUI8(0, value ? 1 : 0); return value; }
}
