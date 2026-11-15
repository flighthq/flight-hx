package flight._hl;

abstract PackResult(hl.Bytes) {
	public var width(get, set):Single;

	inline function get_width():Single return this.getF32(24);

	inline function set_width(value:Single):Single { this.setF32(24, value); return value; }
	public var height(get, set):Single;

	inline function get_height():Single return this.getF32(28);

	inline function set_height(value:Single):Single { this.setF32(28, value); return value; }
}
