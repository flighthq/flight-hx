package flight._cpp;

private extern class GltfDracoMesh_Ffi {
	@:native("flight_get_gltf_draco_mesh_vertex_count") static function get_vertexCount(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_gltf_draco_mesh_vertex_count") static function set_vertexCount(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract GltfDracoMesh(cpp.Star<cpp.Void>) {
	public var vertexCount(get, set):Int;

	inline function get_vertexCount():Int return GltfDracoMesh_Ffi.get_vertexCount(this);

	inline function set_vertexCount(value:Int):Int { GltfDracoMesh_Ffi.set_vertexCount(this, value); return value; }
}
