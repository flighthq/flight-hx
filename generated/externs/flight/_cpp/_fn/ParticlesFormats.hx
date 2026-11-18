package flight._cpp._fn;

extern class ParticlesFormats {
	@:native("flight_detect_particle_format")
	public static function detectParticleFormat(registry:flight._cpp.ParticleFormatRegistry, text:cpp.ConstCharStar):flight._cpp.ParticleFormatKind;
	@:native("flight_detect_registered_particle_format")
	public static function detectRegisteredParticleFormat(registry:flight._cpp.ParticleFormatRegistry, text:cpp.ConstCharStar):flight._cpp.ParticleFormatKind;
	@:native("flight_get_registered_particle_formats")
	public static function getRegisteredParticleFormats(out:cpp.Star<cpp.Void>, registry:flight._cpp.ParticleFormatRegistry):Void;
	@:native("flight_parse_registered_particle_format")
	public static function parseRegisteredParticleFormat(registry:flight._cpp.ParticleFormatRegistry, text:cpp.ConstCharStar, kind:cpp.ConstCharStar, options:flight._cpp.ParseParticleConfigOptions):flight._cpp.ParticleConfigParseResult;
	@:native("flight_unregister_particle_format")
	public static function unregisterParticleFormat(registry:flight._cpp.ParticleFormatRegistry, kind:cpp.ConstCharStar):Bool;
	@:native("flight_parse_libgdx_particle")
	public static function parseLibgdxParticle(text:cpp.ConstCharStar, options:flight._cpp.LibgdxParseOptions):flight._cpp.ParticleEmitterConfig;
	@:native("flight_parse_libgdx_particle_document")
	public static function parseLibgdxParticleDocument(text:cpp.ConstCharStar, options:flight._cpp.LibgdxParseOptions):flight._cpp.LibgdxParseResult;
	@:native("flight_serialize_libgdx_particle")
	public static function serializeLibgdxParticle(config:flight._cpp.ParticleEmitterConfig, existing:flight._cpp.LibgdxParticleDocument, options:flight._cpp.LibgdxSerializeOptions):cpp.ConstCharStar;
	@:native("flight_serialize_libgdx_particle_document")
	public static function serializeLibgdxParticleDocument(config:flight._cpp.ParticleEmitterConfig, existing:flight._cpp.LibgdxParticleDocument, options:flight._cpp.LibgdxSerializeOptions):flight._cpp.ParticleSerializeResult;
	@:native("flight_parse_particle_config")
	public static function parseParticleConfig(registry:flight._cpp.ParticleFormatRegistry, text:cpp.ConstCharStar, options:flight._cpp.ParseParticleConfigOptions):flight._cpp.ParticleEmitterConfig;
	@:native("flight_parse_particle_config_document")
	public static function parseParticleConfigDocument(registry:flight._cpp.ParticleFormatRegistry, text:cpp.ConstCharStar, options:flight._cpp.ParseParticleConfigOptions):flight._cpp.ParticleConfigParseResult;
	@:native("flight_parse_particle_designer_plist")
	public static function parseParticleDesignerPlist(plistXml:cpp.ConstCharStar, options:flight._cpp.ParticleDesignerParseOptions):flight._cpp.ParticleEmitterConfig;
	@:native("flight_parse_particle_designer_plist_document")
	public static function parseParticleDesignerPlistDocument(plistXml:cpp.ConstCharStar, options:flight._cpp.ParticleDesignerParseOptions):flight._cpp.ParticleDesignerParseResult;
	@:native("flight_serialize_particle_designer_plist")
	public static function serializeParticleDesignerPlist(config:flight._cpp.ParticleEmitterConfig, existing:flight._cpp.ParticleDesignerDocument, options:flight._cpp.ParticleDesignerSerializeOptions):cpp.ConstCharStar;
	@:native("flight_serialize_particle_designer_plist_document")
	public static function serializeParticleDesignerPlistDocument(config:flight._cpp.ParticleEmitterConfig, existing:flight._cpp.ParticleDesignerDocument, options:flight._cpp.ParticleDesignerSerializeOptions):flight._cpp.ParticleSerializeResult;
	@:native("flight_parse_pixi_particle")
	public static function parsePixiParticle(json:cpp.ConstCharStar):flight._cpp.ParticleEmitterConfig;
	@:native("flight_parse_pixi_particle_document")
	public static function parsePixiParticleDocument(json:cpp.ConstCharStar):flight._cpp.PixiParseResult;
	@:native("flight_apply_particle_import_options")
	public static function applyParticleImportOptions(registry:flight._cpp.ParticleFormatRegistry, options:flight._cpp.ParticleImportOptions):Void;
	@:native("flight_register_built_in_particle_formats")
	public static function registerBuiltInParticleFormats(registry:flight._cpp.ParticleFormatRegistry):Void;
	@:native("flight_parse_spine_particle")
	public static function parseSpineParticle(json:cpp.ConstCharStar):flight._cpp.ParticleEmitterConfig;
	@:native("flight_parse_spine_particle_document")
	public static function parseSpineParticleDocument(json:cpp.ConstCharStar):flight._cpp.SpineParseResult;
	@:native("flight_serialize_spine_particle")
	public static function serializeSpineParticle(config:flight._cpp.ParticleEmitterConfig, existing:flight._cpp.SpineParticleDocument):cpp.ConstCharStar;
	@:native("flight_serialize_spine_particle_document")
	public static function serializeSpineParticleDocument(config:flight._cpp.ParticleEmitterConfig, existing:flight._cpp.SpineParticleDocument):flight._cpp.ParticleSerializeResult;
	@:native("flight_parse_starling_pex")
	public static function parseStarlingPex(xml:cpp.ConstCharStar, options:flight._cpp.StarlingPexParseOptions):flight._cpp.ParticleEmitterConfig;
	@:native("flight_parse_starling_pex_document")
	public static function parseStarlingPexDocument(xml:cpp.ConstCharStar, options:flight._cpp.StarlingPexParseOptions):flight._cpp.StarlingPexParseResult;
	@:native("flight_serialize_starling_pex")
	public static function serializeStarlingPex(config:flight._cpp.ParticleEmitterConfig, existing:flight._cpp.StarlingPexDocument, options:flight._cpp.StarlingPexSerializeOptions):cpp.ConstCharStar;
	@:native("flight_serialize_starling_pex_document")
	public static function serializeStarlingPexDocument(config:flight._cpp.ParticleEmitterConfig, existing:flight._cpp.StarlingPexDocument, options:flight._cpp.StarlingPexSerializeOptions):flight._cpp.ParticleSerializeResult;
	@:native("flight_parse_unity_particle")
	public static function parseUnityParticle(json:cpp.ConstCharStar, options:flight._cpp.UnityParseOptions):flight._cpp.ParticleEmitterConfig;
	@:native("flight_parse_unity_particle_document")
	public static function parseUnityParticleDocument(json:cpp.ConstCharStar, options:flight._cpp.UnityParseOptions):flight._cpp.UnityParseResult;
	@:native("flight_serialize_unity_particle")
	public static function serializeUnityParticle(config:flight._cpp.ParticleEmitterConfig, existing:flight._cpp.UnityParticleDocument, options:flight._cpp.UnitySerializeOptions):cpp.ConstCharStar;
	@:native("flight_serialize_unity_particle_document")
	public static function serializeUnityParticleDocument(config:flight._cpp.ParticleEmitterConfig, existing:flight._cpp.UnityParticleDocument, options:flight._cpp.UnitySerializeOptions):flight._cpp.ParticleSerializeResult;
	@:native("flight_free_particle_format_kind")
	public static function freeParticleFormatKind(ptr:flight._cpp.ParticleFormatKind):Void;
	@:native("flight_free_particle_config_parse_result")
	public static function freeParticleConfigParseResult(ptr:flight._cpp.ParticleConfigParseResult):Void;
	@:native("flight_free_libgdx_parse_result")
	public static function freeLibgdxParseResult(ptr:flight._cpp.LibgdxParseResult):Void;
	@:native("flight_free_particle_serialize_result")
	public static function freeParticleSerializeResult(ptr:flight._cpp.ParticleSerializeResult):Void;
	@:native("flight_free_particle_designer_parse_result")
	public static function freeParticleDesignerParseResult(ptr:flight._cpp.ParticleDesignerParseResult):Void;
	@:native("flight_free_pixi_parse_result")
	public static function freePixiParseResult(ptr:flight._cpp.PixiParseResult):Void;
	@:native("flight_free_spine_parse_result")
	public static function freeSpineParseResult(ptr:flight._cpp.SpineParseResult):Void;
	@:native("flight_free_starling_pex_parse_result")
	public static function freeStarlingPexParseResult(ptr:flight._cpp.StarlingPexParseResult):Void;
	@:native("flight_free_unity_parse_result")
	public static function freeUnityParseResult(ptr:flight._cpp.UnityParseResult):Void;
}
