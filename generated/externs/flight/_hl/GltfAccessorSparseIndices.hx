package flight._hl;

abstract GltfAccessorSparseIndices(hl.Bytes) {
	public var bufferView(get, set):Float;

	inline function get_bufferView():Float return this.getF64(16);

	inline function set_bufferView(value:Float):Float { this.setF64(16, value); return value; }
}
