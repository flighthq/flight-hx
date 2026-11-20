package flight._cpp;

private extern class GltfTextureBasisu_Ffi {
	@:native("flight_get_gltf_texture_basisu_source") static function get_source(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_gltf_texture_basisu_source") static function set_source(ptr:cpp.Star<cpp.Void>, value:Float):Float;
}

abstract GltfTextureBasisu(cpp.Star<cpp.Void>) {
	public var source(get, set):Float;

	inline function get_source():Float return GltfTextureBasisu_Ffi.get_source(this);

	inline function set_source(value:Float):Float { GltfTextureBasisu_Ffi.set_source(this, value); return value; }
}
