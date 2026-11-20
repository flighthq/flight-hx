package flight._js;

abstract GltfDracoMesh(Dynamic) {
	public var vertexCount(get, set):Int;
	inline function get_vertexCount():Int return untyped this.vertexCount;
	inline function set_vertexCount(value:Int):Int return untyped this.vertexCount = value;
}
