package flight._cpp;

private extern class GltfTextureInfo_Ffi {
	@:native("flight_get_gltf_texture_info_index") static function get_index(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_gltf_texture_info_index") static function set_index(ptr:cpp.Star<cpp.Void>, value:Float):Float;
}

abstract GltfTextureInfo(cpp.Star<cpp.Void>) {
	public var index(get, set):Float;

	inline function get_index():Float return GltfTextureInfo_Ffi.get_index(this);

	inline function set_index(value:Float):Float { GltfTextureInfo_Ffi.set_index(this, value); return value; }
}
