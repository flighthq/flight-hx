package flight._cpp;

private extern class GltfDracoMeshCompression_Ffi {
	@:native("flight_get_gltf_draco_mesh_compression_buffer_view") static function get_bufferView(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_gltf_draco_mesh_compression_buffer_view") static function set_bufferView(ptr:cpp.Star<cpp.Void>, value:Float):Float;
}

abstract GltfDracoMeshCompression(cpp.Star<cpp.Void>) {
	public var bufferView(get, set):Float;

	inline function get_bufferView():Float return GltfDracoMeshCompression_Ffi.get_bufferView(this);

	inline function set_bufferView(value:Float):Float { GltfDracoMeshCompression_Ffi.set_bufferView(this, value); return value; }
}
