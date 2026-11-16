package flight._cpp;

private extern class GltfNodePunctualLight_Ffi {
	@:native("flight_get_gltf_node_punctual_light_light") static function get_light(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_gltf_node_punctual_light_light") static function set_light(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract GltfNodePunctualLight(cpp.Star<cpp.Void>) {
	public var light(get, set):Single;

	inline function get_light():Single return GltfNodePunctualLight_Ffi.get_light(this);

	inline function set_light(value:Single):Single { GltfNodePunctualLight_Ffi.set_light(this, value); return value; }
}
