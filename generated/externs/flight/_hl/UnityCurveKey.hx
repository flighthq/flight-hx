package flight._hl;

abstract UnityCurveKey(hl.Bytes) {
	public var time(get, set):Single;

	inline function get_time():Single return this.getF32(0);

	inline function set_time(value:Single):Single { this.setF32(0, value); return value; }
	public var value(get, set):Single;

	inline function get_value():Single return this.getF32(4);

	inline function set_value(value:Single):Single { this.setF32(4, value); return value; }
}
