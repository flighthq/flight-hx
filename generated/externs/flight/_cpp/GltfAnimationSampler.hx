package flight._cpp;

private extern class GltfAnimationSampler_Ffi {
	@:native("flight_get_gltf_animation_sampler_input") static function get_input(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_gltf_animation_sampler_input") static function set_input(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_gltf_animation_sampler_output") static function get_output(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_gltf_animation_sampler_output") static function set_output(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract GltfAnimationSampler(cpp.Star<cpp.Void>) {
	public var input(get, set):Single;

	inline function get_input():Single return GltfAnimationSampler_Ffi.get_input(this);

	inline function set_input(value:Single):Single { GltfAnimationSampler_Ffi.set_input(this, value); return value; }
	public var output(get, set):Single;

	inline function get_output():Single return GltfAnimationSampler_Ffi.get_output(this);

	inline function set_output(value:Single):Single { GltfAnimationSampler_Ffi.set_output(this, value); return value; }
}
