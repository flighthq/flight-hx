package flight._hl;

abstract TextBoundsSpec(hl.Bytes) {
	public var height(get, set):Single;

	inline function get_height():Single return this.getF32(4);

	inline function set_height(value:Single):Single { this.setF32(4, value); return value; }
	public var width(get, set):Single;

	inline function get_width():Single return this.getF32(8);

	inline function set_width(value:Single):Single { this.setF32(8, value); return value; }
}
