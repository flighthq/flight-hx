package flight._cpp;

private extern class EnvReflectModifier_Ffi {
	@:native("flight_get_env_reflect_modifier_tint") static function get_tint(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_env_reflect_modifier_tint") static function set_tint(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_env_reflect_modifier_intensity") static function get_intensity(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_env_reflect_modifier_intensity") static function set_intensity(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_env_reflect_modifier_fresnel_bias") static function get_fresnelBias(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_env_reflect_modifier_fresnel_bias") static function set_fresnelBias(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_env_reflect_modifier_roughness") static function get_roughness(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_env_reflect_modifier_roughness") static function set_roughness(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract EnvReflectModifier(cpp.Star<cpp.Void>) {
	public var tint(get, set):Int;

	inline function get_tint():Int return EnvReflectModifier_Ffi.get_tint(this);

	inline function set_tint(value:Int):Int return EnvReflectModifier_Ffi.set_tint(this, value);
	public var intensity(get, set):Single;

	inline function get_intensity():Single return EnvReflectModifier_Ffi.get_intensity(this);

	inline function set_intensity(value:Single):Single return EnvReflectModifier_Ffi.set_intensity(this, value);
	public var fresnelBias(get, set):Single;

	inline function get_fresnelBias():Single return EnvReflectModifier_Ffi.get_fresnelBias(this);

	inline function set_fresnelBias(value:Single):Single return EnvReflectModifier_Ffi.set_fresnelBias(this, value);
	public var roughness(get, set):Single;

	inline function get_roughness():Single return EnvReflectModifier_Ffi.get_roughness(this);

	inline function set_roughness(value:Single):Single return EnvReflectModifier_Ffi.set_roughness(this, value);
}
