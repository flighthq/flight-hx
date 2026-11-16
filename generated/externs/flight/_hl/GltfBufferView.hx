package flight._hl;

abstract GltfBufferView(hl.Bytes) {
	public var buffer(get, set):Single;

	inline function get_buffer():Single return this.getF32(16);

	inline function set_buffer(value:Single):Single { this.setF32(16, value); return value; }
	public var byteLength(get, set):Single;

	inline function get_byteLength():Single return this.getF32(20);

	inline function set_byteLength(value:Single):Single { this.setF32(20, value); return value; }
}
