package flight._js;

@:jsRequire("flight")
private extern class EnvReflectModifier_Ffi {
	@:native("flight_get_env_reflect_modifier_tint") static function get_tint(ptr:Dynamic):Int;
	@:native("flight_set_env_reflect_modifier_tint") static function set_tint(ptr:Dynamic, value:Int):Int;
	@:native("flight_get_env_reflect_modifier_intensity") static function get_intensity(ptr:Dynamic):Float;
	@:native("flight_set_env_reflect_modifier_intensity") static function set_intensity(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_env_reflect_modifier_fresnel_bias") static function get_fresnelBias(ptr:Dynamic):Float;
	@:native("flight_set_env_reflect_modifier_fresnel_bias") static function set_fresnelBias(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_env_reflect_modifier_roughness") static function get_roughness(ptr:Dynamic):Float;
	@:native("flight_set_env_reflect_modifier_roughness") static function set_roughness(ptr:Dynamic, value:Float):Float;
}

abstract EnvReflectModifier(Dynamic) {
	public var tint(get, set):Int;

	inline function get_tint():Int return EnvReflectModifier_Ffi.get_tint(this);

	inline function set_tint(value:Int):Int return EnvReflectModifier_Ffi.set_tint(this, value);
	public var intensity(get, set):Float;

	inline function get_intensity():Float return EnvReflectModifier_Ffi.get_intensity(this);

	inline function set_intensity(value:Float):Float return EnvReflectModifier_Ffi.set_intensity(this, value);
	public var fresnelBias(get, set):Float;

	inline function get_fresnelBias():Float return EnvReflectModifier_Ffi.get_fresnelBias(this);

	inline function set_fresnelBias(value:Float):Float return EnvReflectModifier_Ffi.set_fresnelBias(this, value);
	public var roughness(get, set):Float;

	inline function get_roughness():Float return EnvReflectModifier_Ffi.get_roughness(this);

	inline function set_roughness(value:Float):Float return EnvReflectModifier_Ffi.set_roughness(this, value);
}
