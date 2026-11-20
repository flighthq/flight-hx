package flight._cpp;

private extern class GltfAccessorSparseIndices_Ffi {
	@:native("flight_get_gltf_accessor_sparse_indices_buffer_view") static function get_bufferView(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_gltf_accessor_sparse_indices_buffer_view") static function set_bufferView(ptr:cpp.Star<cpp.Void>, value:Float):Float;
}

abstract GltfAccessorSparseIndices(cpp.Star<cpp.Void>) {
	public var bufferView(get, set):Float;

	inline function get_bufferView():Float return GltfAccessorSparseIndices_Ffi.get_bufferView(this);

	inline function set_bufferView(value:Float):Float { GltfAccessorSparseIndices_Ffi.set_bufferView(this, value); return value; }
}
