package flight._cpp._fn;

extern class Shading {
	@:native("flight_create_animated_normal_modifier")
	public static function createAnimatedNormalModifier():flight._cpp.AnimatedNormalModifier;
	@:native("flight_create_dissolve_modifier")
	public static function createDissolveModifier():flight._cpp.DissolveModifier;
	@:native("flight_create_emissive_modifier")
	public static function createEmissiveModifier():flight._cpp.EmissiveModifier;
	@:native("flight_create_env_reflect_modifier")
	public static function createEnvReflectModifier():flight._cpp.EnvReflectModifier;
	@:native("flight_create_fog_modifier")
	public static function createFogModifier():flight._cpp.FogModifier;
	@:native("flight_is_built_in_modifier_slot")
	public static function isBuiltInModifierSlot(value:cpp.ConstCharStar):Bool;
	@:native("flight_register_modifier")
	public static function registerModifier(registry:flight._cpp.ModifierRegistry, definition:cpp.Star<cpp.Void>):Void;
	@:native("flight_resolve_modifier")
	public static function resolveModifier(registry:flight._cpp.ModifierRegistry, kind:cpp.ConstCharStar):cpp.Star<cpp.Void>;
	@:native("flight_register_built_in_modifiers")
	public static function registerBuiltInModifiers(registry:flight._cpp.ModifierRegistry):Void;
	@:native("flight_create_rim_modifier")
	public static function createRimModifier():flight._cpp.RimModifier;
	@:native("flight_create_shaded_material")
	public static function createShadedMaterial():flight._cpp.ShadedMaterial;
	@:native("flight_create_toon_modifier")
	public static function createToonModifier():flight._cpp.ToonModifier;
	@:native("flight_create_vertex_displace_modifier")
	public static function createVertexDisplaceModifier():flight._cpp.VertexDisplaceModifier;
	@:native("flight_free_animated_normal_modifier")
	public static function freeAnimatedNormalModifier(ptr:flight._cpp.AnimatedNormalModifier):Void;
	@:native("flight_free_dissolve_modifier")
	public static function freeDissolveModifier(ptr:flight._cpp.DissolveModifier):Void;
	@:native("flight_free_emissive_modifier")
	public static function freeEmissiveModifier(ptr:flight._cpp.EmissiveModifier):Void;
	@:native("flight_free_env_reflect_modifier")
	public static function freeEnvReflectModifier(ptr:flight._cpp.EnvReflectModifier):Void;
	@:native("flight_free_fog_modifier")
	public static function freeFogModifier(ptr:flight._cpp.FogModifier):Void;
	@:native("flight_free_rim_modifier")
	public static function freeRimModifier(ptr:flight._cpp.RimModifier):Void;
	@:native("flight_free_shaded_material")
	public static function freeShadedMaterial(ptr:flight._cpp.ShadedMaterial):Void;
	@:native("flight_free_toon_modifier")
	public static function freeToonModifier(ptr:flight._cpp.ToonModifier):Void;
	@:native("flight_free_vertex_displace_modifier")
	public static function freeVertexDisplaceModifier(ptr:flight._cpp.VertexDisplaceModifier):Void;
}
