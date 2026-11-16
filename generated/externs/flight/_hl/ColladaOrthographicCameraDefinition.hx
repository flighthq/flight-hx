package flight._hl;

abstract ColladaOrthographicCameraDefinition(hl.Bytes) {
	public var far(get, set):Single;

	inline function get_far():Single return this.getF32(24);

	inline function set_far(value:Single):Single { this.setF32(24, value); return value; }
	public var halfHeight(get, set):Single;

	inline function get_halfHeight():Single return this.getF32(28);

	inline function set_halfHeight(value:Single):Single { this.setF32(28, value); return value; }
	public var halfWidth(get, set):Single;

	inline function get_halfWidth():Single return this.getF32(32);

	inline function set_halfWidth(value:Single):Single { this.setF32(32, value); return value; }
	public var near(get, set):Single;

	inline function get_near():Single return this.getF32(36);

	inline function set_near(value:Single):Single { this.setF32(36, value); return value; }
}
