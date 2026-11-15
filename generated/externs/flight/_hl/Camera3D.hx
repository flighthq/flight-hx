package flight._hl;

abstract Camera3D(hl.Bytes) {
	public var far(get, set):Single;

	inline function get_far():Single return this.getF32(16);

	inline function set_far(value:Single):Single { this.setF32(16, value); return value; }
	public var near(get, set):Single;

	inline function get_near():Single return this.getF32(40);

	inline function set_near(value:Single):Single { this.setF32(40, value); return value; }
}
