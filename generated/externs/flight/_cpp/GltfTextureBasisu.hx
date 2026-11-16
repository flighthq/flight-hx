package flight._cpp;

private extern class GltfTextureBasisu_Ffi {
	@:native("flight_get_gltf_texture_basisu_source") static function get_source(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_gltf_texture_basisu_source") static function set_source(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract GltfTextureBasisu(cpp.Star<cpp.Void>) {
	public var source(get, set):Single;

	inline function get_source():Single return GltfTextureBasisu_Ffi.get_source(this);

	inline function set_source(value:Single):Single { GltfTextureBasisu_Ffi.set_source(this, value); return value; }
}
