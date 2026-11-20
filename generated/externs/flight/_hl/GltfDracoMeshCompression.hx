package flight._hl;

abstract GltfDracoMeshCompression(hl.Bytes) {
	public var bufferView(get, set):Float;

	inline function get_bufferView():Float return this.getF64(8);

	inline function set_bufferView(value:Float):Float { this.setF64(8, value); return value; }
}
