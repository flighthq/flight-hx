package flight._cpp;

private extern class GltfAccessorSparseIndices_Ffi {
	@:native("flight_get_gltf_accessor_sparse_indices_buffer_view") static function get_bufferView(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_gltf_accessor_sparse_indices_buffer_view") static function set_bufferView(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract GltfAccessorSparseIndices(cpp.Star<cpp.Void>) {
	public var bufferView(get, set):Single;

	inline function get_bufferView():Single return GltfAccessorSparseIndices_Ffi.get_bufferView(this);

	inline function set_bufferView(value:Single):Single { GltfAccessorSparseIndices_Ffi.set_bufferView(this, value); return value; }
}
