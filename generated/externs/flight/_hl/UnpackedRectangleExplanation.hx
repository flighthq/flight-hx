package flight._hl;

abstract UnpackedRectangleExplanation(hl.Bytes) {
	public var usableWidth(get, set):Single;

	inline function get_usableWidth():Single return this.getF32(28);

	inline function set_usableWidth(value:Single):Single { this.setF32(28, value); return value; }
	public var usableHeight(get, set):Single;

	inline function get_usableHeight():Single return this.getF32(32);

	inline function set_usableHeight(value:Single):Single { this.setF32(32, value); return value; }
}
