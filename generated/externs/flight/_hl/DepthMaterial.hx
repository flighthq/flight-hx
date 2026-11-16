package flight._hl;

abstract DepthMaterial(hl.Bytes) {
	public var far(get, set):Single;

	inline function get_far():Single return this.getF32(104);

	inline function set_far(value:Single):Single { this.setF32(104, value); return value; }
	public var near(get, set):Single;

	inline function get_near():Single return this.getF32(108);

	inline function set_near(value:Single):Single { this.setF32(108, value); return value; }
}
