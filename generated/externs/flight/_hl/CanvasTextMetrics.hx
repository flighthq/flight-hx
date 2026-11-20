package flight._hl;

abstract CanvasTextMetrics(hl.Bytes) {
	public var width(get, set):Single;

	inline function get_width():Single return this.getF32(0);

	inline function set_width(value:Single):Single { this.setF32(0, value); return value; }
}
