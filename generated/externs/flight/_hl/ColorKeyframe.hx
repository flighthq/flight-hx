package flight._hl;

abstract ColorKeyframe(hl.Bytes) {
	public var time(get, set):Single;

	inline function get_time():Single return this.getF32(0);

	inline function set_time(value:Single):Single { this.setF32(0, value); return value; }
	public var r(get, set):Single;

	inline function get_r():Single return this.getF32(4);

	inline function set_r(value:Single):Single { this.setF32(4, value); return value; }
	public var g(get, set):Single;

	inline function get_g():Single return this.getF32(8);

	inline function set_g(value:Single):Single { this.setF32(8, value); return value; }
	public var b(get, set):Single;

	inline function get_b():Single return this.getF32(12);

	inline function set_b(value:Single):Single { this.setF32(12, value); return value; }
}
