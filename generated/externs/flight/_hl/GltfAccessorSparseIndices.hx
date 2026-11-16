package flight._hl;

abstract GltfAccessorSparseIndices(hl.Bytes) {
	public var bufferView(get, set):Single;

	inline function get_bufferView():Single return this.getF32(8);

	inline function set_bufferView(value:Single):Single { this.setF32(8, value); return value; }
}
