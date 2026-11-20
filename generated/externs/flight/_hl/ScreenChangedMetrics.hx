package flight._hl;

abstract ScreenChangedMetrics(hl.Bytes) {
	public var bounds(get, set):Bool;

	inline function get_bounds():Bool return this.getUI8(0) != 0;

	inline function set_bounds(value:Bool):Bool { this.setUI8(0, value ? 1 : 0); return value; }
	public var workArea(get, set):Bool;

	inline function get_workArea():Bool return this.getUI8(1) != 0;

	inline function set_workArea(value:Bool):Bool { this.setUI8(1, value ? 1 : 0); return value; }
	public var scaleFactor(get, set):Bool;

	inline function get_scaleFactor():Bool return this.getUI8(2) != 0;

	inline function set_scaleFactor(value:Bool):Bool { this.setUI8(2, value ? 1 : 0); return value; }
	public var orientation(get, set):Bool;

	inline function get_orientation():Bool return this.getUI8(3) != 0;

	inline function set_orientation(value:Bool):Bool { this.setUI8(3, value ? 1 : 0); return value; }
}
