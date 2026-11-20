package flight._cpp;

private extern class GltfAccessorSparse_Ffi {
	@:native("flight_get_gltf_accessor_sparse_count") static function get_count(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_gltf_accessor_sparse_count") static function set_count(ptr:cpp.Star<cpp.Void>, value:Float):Float;
}

abstract GltfAccessorSparse(cpp.Star<cpp.Void>) {
	public var count(get, set):Float;

	inline function get_count():Float return GltfAccessorSparse_Ffi.get_count(this);

	inline function set_count(value:Float):Float { GltfAccessorSparse_Ffi.set_count(this, value); return value; }
}
