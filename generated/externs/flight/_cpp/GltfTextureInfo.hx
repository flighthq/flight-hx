package flight._cpp;

private extern class GltfTextureInfo_Ffi {
	@:native("flight_get_gltf_texture_info_index") static function get_index(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_gltf_texture_info_index") static function set_index(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract GltfTextureInfo(cpp.Star<cpp.Void>) {
	public var index(get, set):Single;

	inline function get_index():Single return GltfTextureInfo_Ffi.get_index(this);

	inline function set_index(value:Single):Single { GltfTextureInfo_Ffi.set_index(this, value); return value; }
}
