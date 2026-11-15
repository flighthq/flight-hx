package flight._hl;

abstract Physics2DGearJoint(hl.Bytes) {
	public var axisAx(get, set):Single;

	inline function get_axisAx():Single return this.getF32(136);

	inline function set_axisAx(value:Single):Single { this.setF32(136, value); return value; }
	public var axisAy(get, set):Single;

	inline function get_axisAy():Single return this.getF32(140);

	inline function set_axisAy(value:Single):Single { this.setF32(140, value); return value; }
	public var axisBx(get, set):Single;

	inline function get_axisBx():Single return this.getF32(144);

	inline function set_axisBx(value:Single):Single { this.setF32(144, value); return value; }
	public var axisBy(get, set):Single;

	inline function get_axisBy():Single return this.getF32(148);

	inline function set_axisBy(value:Single):Single { this.setF32(148, value); return value; }
	public var constant(get, set):Single;

	inline function get_constant():Single return this.getF32(152);

	inline function set_constant(value:Single):Single { this.setF32(152, value); return value; }
	public var ratio(get, set):Single;

	inline function get_ratio():Single return this.getF32(164);

	inline function set_ratio(value:Single):Single { this.setF32(164, value); return value; }
}
