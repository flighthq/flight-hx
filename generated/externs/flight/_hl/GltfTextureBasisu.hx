package flight._hl;

abstract GltfTextureBasisu(hl.Bytes) {
	public var source(get, set):Single;

	inline function get_source():Single return this.getF32(0);

	inline function set_source(value:Single):Single { this.setF32(0, value); return value; }
}
