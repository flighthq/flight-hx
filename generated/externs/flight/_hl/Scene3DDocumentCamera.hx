package flight._hl;

abstract Scene3DDocumentCamera(hl.Bytes) {
	public var far(get, set):Single;

	inline function get_far():Single return this.getF32(160);

	inline function set_far(value:Single):Single { this.setF32(160, value); return value; }
	public var near(get, set):Single;

	inline function get_near():Single return this.getF32(164);

	inline function set_near(value:Single):Single { this.setF32(164, value); return value; }
}
