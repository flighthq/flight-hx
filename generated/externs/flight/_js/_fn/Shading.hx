package flight._js._fn;

@:jsRequire("@flighthq/shading")
extern class Shading {
	@:native("createAnimatedNormalModifier")
	public static function createAnimatedNormalModifier():flight._js.AnimatedNormalModifier;
	@:native("createDissolveModifier")
	public static function createDissolveModifier():flight._js.DissolveModifier;
	@:native("createEmissiveModifier")
	public static function createEmissiveModifier():flight._js.EmissiveModifier;
	@:native("getEmissiveModifierFacingString")
	public static function getEmissiveModifierFacingString(value:Dynamic):String;
	@:native("getFogModifierModeString")
	public static function getFogModifierModeString(value:Dynamic):String;
	@:native("getVertexDisplaceModifierSourceString")
	public static function getVertexDisplaceModifierSourceString(value:Dynamic):String;
	@:native("parseEmissiveModifierFacing")
	public static function parseEmissiveModifierFacing(value:String):Null<Dynamic>;
	@:native("parseFogModifierMode")
	public static function parseFogModifierMode(value:String):Null<Dynamic>;
	@:native("parseVertexDisplaceModifierSource")
	public static function parseVertexDisplaceModifierSource(value:String):Null<Dynamic>;
	@:native("createEnvReflectModifier")
	public static function createEnvReflectModifier():flight._js.EnvReflectModifier;
	@:native("createFogModifier")
	public static function createFogModifier():flight._js.FogModifier;
	@:native("isBuiltInModifierSlot")
	public static function isBuiltInModifierSlot(value:String):Bool;
	@:native("registerModifier")
	public static function registerModifier(registry:flight._js.ModifierRegistry, definition:Dynamic):Void;
	@:native("resolveModifier")
	public static function resolveModifier(registry:flight._js.ModifierRegistry, kind:String):Null<Dynamic>;
	@:native("registerBuiltInModifiers")
	public static function registerBuiltInModifiers(registry:flight._js.ModifierRegistry):Void;
	@:native("createRimModifier")
	public static function createRimModifier():flight._js.RimModifier;
	@:native("createShadedMaterial")
	public static function createShadedMaterial():flight._js.ShadedMaterial;
	@:native("createToonModifier")
	public static function createToonModifier():flight._js.ToonModifier;
	@:native("createVertexDisplaceModifier")
	public static function createVertexDisplaceModifier():flight._js.VertexDisplaceModifier;
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeAnimatedNormalModifier(ptr:flight._js.AnimatedNormalModifier):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeDissolveModifier(ptr:flight._js.DissolveModifier):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeEmissiveModifier(ptr:flight._js.EmissiveModifier):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeEnvReflectModifier(ptr:flight._js.EnvReflectModifier):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeFogModifier(ptr:flight._js.FogModifier):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeRimModifier(ptr:flight._js.RimModifier):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeShadedMaterial(ptr:flight._js.ShadedMaterial):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeToonModifier(ptr:flight._js.ToonModifier):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeVertexDisplaceModifier(ptr:flight._js.VertexDisplaceModifier):Void {}
}
