package flight._hl;

abstract SkinInfluence(hl.Bytes) {
	public var jointIndex(get, set):Single;

	inline function get_jointIndex():Single return this.getF32(0);

	inline function set_jointIndex(value:Single):Single { this.setF32(0, value); return value; }
	public var weight(get, set):Single;

	inline function get_weight():Single return this.getF32(4);

	inline function set_weight(value:Single):Single { this.setF32(4, value); return value; }
}
