package flight._hl;

abstract Camera3DOptions(hl.Bytes) {
	public var far(get, set):Single;

	inline function get_far():Single return this.getF32(0);

	inline function set_far(value:Single):Single { this.setF32(0, value); return value; }
	public var near(get, set):Single;

	inline function get_near():Single return this.getF32(4);

	inline function set_near(value:Single):Single { this.setF32(4, value); return value; }
}
