package flight._cpp;

private extern class GltfNodePunctualLight_Ffi {
	@:native("flight_get_gltf_node_punctual_light_light") static function get_light(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_gltf_node_punctual_light_light") static function set_light(ptr:cpp.Star<cpp.Void>, value:Float):Float;
}

abstract GltfNodePunctualLight(cpp.Star<cpp.Void>) {
	public var light(get, set):Float;

	inline function get_light():Float return GltfNodePunctualLight_Ffi.get_light(this);

	inline function set_light(value:Float):Float { GltfNodePunctualLight_Ffi.set_light(this, value); return value; }
}
