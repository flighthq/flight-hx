package flight._hl;

abstract SpineRangeValue(hl.Bytes) {
	public var high(get, set):Single;

	inline function get_high():Single return this.getF32(0);

	inline function set_high(value:Single):Single { this.setF32(0, value); return value; }
	public var low(get, set):Single;

	inline function get_low():Single return this.getF32(4);

	inline function set_low(value:Single):Single { this.setF32(4, value); return value; }
}
