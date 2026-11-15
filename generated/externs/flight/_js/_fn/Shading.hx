package flight._js._fn;

@:jsRequire("flight")
extern class Shading {
	@:native("flight_create_animated_normal_modifier")
	public static function createAnimatedNormalModifier():flight._js.AnimatedNormalModifier;
	@:native("flight_create_dissolve_modifier")
	public static function createDissolveModifier():flight._js.DissolveModifier;
	@:native("flight_create_emissive_modifier")
	public static function createEmissiveModifier():flight._js.EmissiveModifier;
	@:native("flight_get_emissive_modifier_facing_string")
	public static function getEmissiveModifierFacingString(value:Int):String;
	@:native("flight_get_fog_modifier_mode_string")
	public static function getFogModifierModeString(value:Int):String;
	@:native("flight_get_vertex_displace_modifier_source_string")
	public static function getVertexDisplaceModifierSourceString(value:Int):String;
	@:native("flight_parse_emissive_modifier_facing")
	public static function parseEmissiveModifierFacing(value:String):Int;
	@:native("flight_parse_fog_modifier_mode")
	public static function parseFogModifierMode(value:String):Int;
	@:native("flight_parse_vertex_displace_modifier_source")
	public static function parseVertexDisplaceModifierSource(value:String):Int;
	@:native("flight_create_env_reflect_modifier")
	public static function createEnvReflectModifier():flight._js.EnvReflectModifier;
	@:native("flight_create_fog_modifier")
	public static function createFogModifier():flight._js.FogModifier;
	@:native("flight_is_built_in_modifier_slot")
	public static function isBuiltInModifierSlot(value:String):Bool;
	@:native("flight_register_modifier")
	public static function registerModifier(registry:flight._js.ModifierRegistry, definition:Dynamic):Void;
	@:native("flight_resolve_modifier")
	public static function resolveModifier(registry:flight._js.ModifierRegistry, kind:String):Dynamic;
	@:native("flight_register_built_in_modifiers")
	public static function registerBuiltInModifiers(registry:flight._js.ModifierRegistry):Void;
	@:native("flight_create_rim_modifier")
	public static function createRimModifier():flight._js.RimModifier;
	@:native("flight_create_shaded_material")
	public static function createShadedMaterial():flight._js.ShadedMaterial;
	@:native("flight_create_toon_modifier")
	public static function createToonModifier():flight._js.ToonModifier;
	@:native("flight_create_vertex_displace_modifier")
	public static function createVertexDisplaceModifier():flight._js.VertexDisplaceModifier;
	@:native("flight_free_animated_normal_modifier")
	public static function freeAnimatedNormalModifier(ptr:flight._js.AnimatedNormalModifier):Void;
	@:native("flight_free_dissolve_modifier")
	public static function freeDissolveModifier(ptr:flight._js.DissolveModifier):Void;
	@:native("flight_free_emissive_modifier")
	public static function freeEmissiveModifier(ptr:flight._js.EmissiveModifier):Void;
	@:native("flight_free_env_reflect_modifier")
	public static function freeEnvReflectModifier(ptr:flight._js.EnvReflectModifier):Void;
	@:native("flight_free_fog_modifier")
	public static function freeFogModifier(ptr:flight._js.FogModifier):Void;
	@:native("flight_free_rim_modifier")
	public static function freeRimModifier(ptr:flight._js.RimModifier):Void;
	@:native("flight_free_shaded_material")
	public static function freeShadedMaterial(ptr:flight._js.ShadedMaterial):Void;
	@:native("flight_free_toon_modifier")
	public static function freeToonModifier(ptr:flight._js.ToonModifier):Void;
	@:native("flight_free_vertex_displace_modifier")
	public static function freeVertexDisplaceModifier(ptr:flight._js.VertexDisplaceModifier):Void;
}
