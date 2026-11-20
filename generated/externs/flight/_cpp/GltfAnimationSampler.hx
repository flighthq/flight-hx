package flight._cpp;

private extern class GltfAnimationSampler_Ffi {
	@:native("flight_get_gltf_animation_sampler_input") static function get_input(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_gltf_animation_sampler_input") static function set_input(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_gltf_animation_sampler_output") static function get_output(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_gltf_animation_sampler_output") static function set_output(ptr:cpp.Star<cpp.Void>, value:Float):Float;
}

abstract GltfAnimationSampler(cpp.Star<cpp.Void>) {
	public var input(get, set):Float;

	inline function get_input():Float return GltfAnimationSampler_Ffi.get_input(this);

	inline function set_input(value:Float):Float { GltfAnimationSampler_Ffi.set_input(this, value); return value; }
	public var output(get, set):Float;

	inline function get_output():Float return GltfAnimationSampler_Ffi.get_output(this);

	inline function set_output(value:Float):Float { GltfAnimationSampler_Ffi.set_output(this, value); return value; }
}
