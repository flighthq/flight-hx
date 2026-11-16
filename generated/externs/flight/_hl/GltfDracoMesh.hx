package flight._hl;

abstract GltfDracoMesh(hl.Bytes) {
	public var vertexCount(get, set):Int;

	inline function get_vertexCount():Int return this.getI32(16);

	inline function set_vertexCount(value:Int):Int { this.setI32(16, value); return value; }
}
