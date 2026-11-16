package flight._hl;

abstract GltfBuffer(hl.Bytes) {
	public var byteLength(get, set):Single;

	inline function get_byteLength():Single return this.getF32(24);

	inline function set_byteLength(value:Single):Single { this.setF32(24, value); return value; }
}
