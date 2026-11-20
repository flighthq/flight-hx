package flight._cpp;

private extern class GltfAnimationChannel_Ffi {
	@:native("flight_get_gltf_animation_channel_sampler") static function get_sampler(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_gltf_animation_channel_sampler") static function set_sampler(ptr:cpp.Star<cpp.Void>, value:Float):Float;
}

abstract GltfAnimationChannel(cpp.Star<cpp.Void>) {
	public var sampler(get, set):Float;

	inline function get_sampler():Float return GltfAnimationChannel_Ffi.get_sampler(this);

	inline function set_sampler(value:Float):Float { GltfAnimationChannel_Ffi.set_sampler(this, value); return value; }
}
