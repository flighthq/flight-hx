package flight._hl;

abstract GltfAccessorSparse(hl.Bytes) {
	public var count(get, set):Single;

	inline function get_count():Single return this.getF32(16);

	inline function set_count(value:Single):Single { this.setF32(16, value); return value; }
}
