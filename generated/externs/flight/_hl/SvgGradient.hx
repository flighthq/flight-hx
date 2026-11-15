package flight._hl;

abstract SvgGradient(hl.Bytes) {
	public var cx(get, set):Single;

	inline function get_cx():Single return this.getF32(0);

	inline function set_cx(value:Single):Single { this.setF32(0, value); return value; }
	public var cy(get, set):Single;

	inline function get_cy():Single return this.getF32(4);

	inline function set_cy(value:Single):Single { this.setF32(4, value); return value; }
	public var fx(get, set):Single;

	inline function get_fx():Single return this.getF32(8);

	inline function set_fx(value:Single):Single { this.setF32(8, value); return value; }
	public var fy(get, set):Single;

	inline function get_fy():Single return this.getF32(12);

	inline function set_fy(value:Single):Single { this.setF32(12, value); return value; }
	public var radius(get, set):Single;

	inline function get_radius():Single return this.getF32(20);

	inline function set_radius(value:Single):Single { this.setF32(20, value); return value; }
	public var x1(get, set):Single;

	inline function get_x1():Single return this.getF32(108);

	inline function set_x1(value:Single):Single { this.setF32(108, value); return value; }
	public var x2(get, set):Single;

	inline function get_x2():Single return this.getF32(112);

	inline function set_x2(value:Single):Single { this.setF32(112, value); return value; }
	public var y1(get, set):Single;

	inline function get_y1():Single return this.getF32(116);

	inline function set_y1(value:Single):Single { this.setF32(116, value); return value; }
	public var y2(get, set):Single;

	inline function get_y2():Single return this.getF32(120);

	inline function set_y2(value:Single):Single { this.setF32(120, value); return value; }
}
