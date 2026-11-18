package flight._hl._fn;

extern class Shading {
	@:hlNative("flight", "flight_create_animated_normal_modifier")
	public static function createAnimatedNormalModifier():flight._hl.AnimatedNormalModifier;
	@:hlNative("flight", "flight_create_dissolve_modifier")
	public static function createDissolveModifier():flight._hl.DissolveModifier;
	@:hlNative("flight", "flight_create_emissive_modifier")
	public static function createEmissiveModifier():flight._hl.EmissiveModifier;
	@:hlNative("flight", "flight_create_env_reflect_modifier")
	public static function createEnvReflectModifier():flight._hl.EnvReflectModifier;
	@:hlNative("flight", "flight_create_fog_modifier")
	public static function createFogModifier():flight._hl.FogModifier;
	@:hlNative("flight", "flight_is_built_in_modifier_slot")
	public static function isBuiltInModifierSlot(value:hl.Bytes):Bool;
	@:hlNative("flight", "flight_register_modifier")
	public static function registerModifier(registry:flight._hl.ModifierRegistry, definition:hl.Bytes):Void;
	@:hlNative("flight", "flight_resolve_modifier")
	public static function resolveModifier(registry:flight._hl.ModifierRegistry, kind:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_register_built_in_modifiers")
	public static function registerBuiltInModifiers(registry:flight._hl.ModifierRegistry):Void;
	@:hlNative("flight", "flight_create_rim_modifier")
	public static function createRimModifier():flight._hl.RimModifier;
	@:hlNative("flight", "flight_create_shaded_material")
	public static function createShadedMaterial():flight._hl.ShadedMaterial;
	@:hlNative("flight", "flight_create_toon_modifier")
	public static function createToonModifier():flight._hl.ToonModifier;
	@:hlNative("flight", "flight_create_vertex_displace_modifier")
	public static function createVertexDisplaceModifier():flight._hl.VertexDisplaceModifier;
	@:hlNative("flight", "flight_free_animated_normal_modifier")
	public static function freeAnimatedNormalModifier(ptr:flight._hl.AnimatedNormalModifier):Void;
	@:hlNative("flight", "flight_free_dissolve_modifier")
	public static function freeDissolveModifier(ptr:flight._hl.DissolveModifier):Void;
	@:hlNative("flight", "flight_free_emissive_modifier")
	public static function freeEmissiveModifier(ptr:flight._hl.EmissiveModifier):Void;
	@:hlNative("flight", "flight_free_env_reflect_modifier")
	public static function freeEnvReflectModifier(ptr:flight._hl.EnvReflectModifier):Void;
	@:hlNative("flight", "flight_free_fog_modifier")
	public static function freeFogModifier(ptr:flight._hl.FogModifier):Void;
	@:hlNative("flight", "flight_free_rim_modifier")
	public static function freeRimModifier(ptr:flight._hl.RimModifier):Void;
	@:hlNative("flight", "flight_free_shaded_material")
	public static function freeShadedMaterial(ptr:flight._hl.ShadedMaterial):Void;
	@:hlNative("flight", "flight_free_toon_modifier")
	public static function freeToonModifier(ptr:flight._hl.ToonModifier):Void;
	@:hlNative("flight", "flight_free_vertex_displace_modifier")
	public static function freeVertexDisplaceModifier(ptr:flight._hl.VertexDisplaceModifier):Void;
}
