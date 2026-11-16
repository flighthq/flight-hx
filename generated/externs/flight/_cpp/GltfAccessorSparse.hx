package flight._cpp;

private extern class GltfAccessorSparse_Ffi {
	@:native("flight_get_gltf_accessor_sparse_count") static function get_count(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_gltf_accessor_sparse_count") static function set_count(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract GltfAccessorSparse(cpp.Star<cpp.Void>) {
	public var count(get, set):Single;

	inline function get_count():Single return GltfAccessorSparse_Ffi.get_count(this);

	inline function set_count(value:Single):Single { GltfAccessorSparse_Ffi.set_count(this, value); return value; }
}
