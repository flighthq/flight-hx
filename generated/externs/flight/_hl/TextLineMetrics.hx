package flight._hl;

abstract TextLineMetrics(hl.Bytes) {
	public var ascent(get, set):Single;

	inline function get_ascent():Single return this.getF32(0);

	inline function set_ascent(value:Single):Single { this.setF32(0, value); return value; }
	public var descent(get, set):Single;

	inline function get_descent():Single return this.getF32(4);

	inline function set_descent(value:Single):Single { this.setF32(4, value); return value; }
	public var height(get, set):Single;

	inline function get_height():Single return this.getF32(8);

	inline function set_height(value:Single):Single { this.setF32(8, value); return value; }
	public var leading(get, set):Single;

	inline function get_leading():Single return this.getF32(12);

	inline function set_leading(value:Single):Single { this.setF32(12, value); return value; }
	public var width(get, set):Single;

	inline function get_width():Single return this.getF32(16);

	inline function set_width(value:Single):Single { this.setF32(16, value); return value; }
	public var x(get, set):Single;

	inline function get_x():Single return this.getF32(20);

	inline function set_x(value:Single):Single { this.setF32(20, value); return value; }
}
