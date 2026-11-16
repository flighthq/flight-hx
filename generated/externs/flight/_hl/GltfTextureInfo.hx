package flight._hl;

abstract GltfTextureInfo(hl.Bytes) {
	public var index(get, set):Single;

	inline function get_index():Single return this.getF32(16);

	inline function set_index(value:Single):Single { this.setF32(16, value); return value; }
}
