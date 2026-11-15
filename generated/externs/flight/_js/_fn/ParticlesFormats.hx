package flight._js._fn;

@:jsRequire("flight")
extern class ParticlesFormats {
	@:native("flight_detect_particle_format")
	public static function detectParticleFormat(registry:flight._js.ParticleFormatRegistry, text:String):Dynamic;
	@:native("flight_create_particle_format_registry")
	public static function createParticleFormatRegistry():flight._js.ParticleFormatRegistry;
	@:native("flight_detect_registered_particle_format")
	public static function detectRegisteredParticleFormat(registry:flight._js.ParticleFormatRegistry, text:String):Dynamic;
	@:native("flight_get_registered_particle_formats")
	public static function getRegisteredParticleFormats(out:Dynamic, registry:flight._js.ParticleFormatRegistry):Void;
	@:native("flight_parse_registered_particle_format")
	public static function parseRegisteredParticleFormat(registry:flight._js.ParticleFormatRegistry, text:String, kind:String, options:flight._js.ParseParticleConfigOptions):flight._js.ParticleConfigParseResult;
	@:native("flight_register_particle_format")
	public static function registerParticleFormat(registry:flight._js.ParticleFormatRegistry, kind:String, codec:flight._js.ParticleFormatCodec):Void;
	@:native("flight_unregister_particle_format")
	public static function unregisterParticleFormat(registry:flight._js.ParticleFormatRegistry, kind:String):Bool;
	@:native("flight_parse_libgdx_particle")
	public static function parseLibgdxParticle(text:String, options:flight._js.LibgdxParseOptions):flight._js.ParticleEmitterConfig;
	@:native("flight_parse_libgdx_particle_document")
	public static function parseLibgdxParticleDocument(text:String, options:flight._js.LibgdxParseOptions):flight._js.LibgdxParseResult;
	@:native("flight_serialize_libgdx_particle")
	public static function serializeLibgdxParticle(config:flight._js.ParticleEmitterConfig, existing:flight._js.LibgdxParticleDocument, options:flight._js.LibgdxSerializeOptions):String;
	@:native("flight_serialize_libgdx_particle_document")
	public static function serializeLibgdxParticleDocument(config:flight._js.ParticleEmitterConfig, existing:flight._js.LibgdxParticleDocument, options:flight._js.LibgdxSerializeOptions):flight._js.ParticleSerializeResult;
	@:native("flight_parse_particle_config")
	public static function parseParticleConfig(registry:flight._js.ParticleFormatRegistry, text:String, options:flight._js.ParseParticleConfigOptions):flight._js.ParticleEmitterConfig;
	@:native("flight_parse_particle_config_document")
	public static function parseParticleConfigDocument(registry:flight._js.ParticleFormatRegistry, text:String, options:flight._js.ParseParticleConfigOptions):flight._js.ParticleConfigParseResult;
	@:native("flight_parse_particle_designer_plist")
	public static function parseParticleDesignerPlist(plistXml:String, options:flight._js.ParticleDesignerParseOptions):flight._js.ParticleEmitterConfig;
	@:native("flight_parse_particle_designer_plist_document")
	public static function parseParticleDesignerPlistDocument(plistXml:String, options:flight._js.ParticleDesignerParseOptions):flight._js.ParticleDesignerParseResult;
	@:native("flight_serialize_particle_designer_plist")
	public static function serializeParticleDesignerPlist(config:flight._js.ParticleEmitterConfig, existing:flight._js.ParticleDesignerDocument, options:flight._js.ParticleDesignerSerializeOptions):String;
	@:native("flight_serialize_particle_designer_plist_document")
	public static function serializeParticleDesignerPlistDocument(config:flight._js.ParticleEmitterConfig, existing:flight._js.ParticleDesignerDocument, options:flight._js.ParticleDesignerSerializeOptions):flight._js.ParticleSerializeResult;
	@:native("flight_parse_pixi_particle")
	public static function parsePixiParticle(json:String):flight._js.ParticleEmitterConfig;
	@:native("flight_parse_pixi_particle_document")
	public static function parsePixiParticleDocument(json:String):flight._js.PixiParseResult;
	@:native("flight_create_particle_all_formats")
	public static function createParticleAllFormats():Dynamic;
	@:native("flight_apply_particle_import_options")
	public static function applyParticleImportOptions(registry:flight._js.ParticleFormatRegistry, options:flight._js.ParticleImportOptions):Void;
	@:native("flight_get_libgdx_particle_format")
	public static function getLibgdxParticleFormat():flight._js.ParticleFormatDescriptor;
	@:native("flight_get_particle_designer_particle_format")
	public static function getParticleDesignerParticleFormat():flight._js.ParticleFormatDescriptor;
	@:native("flight_get_pixi_particle_format")
	public static function getPixiParticleFormat():flight._js.ParticleFormatDescriptor;
	@:native("flight_get_spine_particle_format")
	public static function getSpineParticleFormat():flight._js.ParticleFormatDescriptor;
	@:native("flight_get_starling_pex_particle_format")
	public static function getStarlingPexParticleFormat():flight._js.ParticleFormatDescriptor;
	@:native("flight_get_unity_particle_format")
	public static function getUnityParticleFormat():flight._js.ParticleFormatDescriptor;
	@:native("flight_register_built_in_particle_formats")
	public static function registerBuiltInParticleFormats(registry:flight._js.ParticleFormatRegistry):Void;
	@:native("flight_parse_spine_particle")
	public static function parseSpineParticle(json:String):flight._js.ParticleEmitterConfig;
	@:native("flight_parse_spine_particle_document")
	public static function parseSpineParticleDocument(json:String):flight._js.SpineParseResult;
	@:native("flight_serialize_spine_particle")
	public static function serializeSpineParticle(config:flight._js.ParticleEmitterConfig, existing:flight._js.SpineParticleDocument):String;
	@:native("flight_serialize_spine_particle_document")
	public static function serializeSpineParticleDocument(config:flight._js.ParticleEmitterConfig, existing:flight._js.SpineParticleDocument):flight._js.ParticleSerializeResult;
	@:native("flight_parse_starling_pex")
	public static function parseStarlingPex(xml:String, options:flight._js.StarlingPexParseOptions):flight._js.ParticleEmitterConfig;
	@:native("flight_parse_starling_pex_document")
	public static function parseStarlingPexDocument(xml:String, options:flight._js.StarlingPexParseOptions):flight._js.StarlingPexParseResult;
	@:native("flight_serialize_starling_pex")
	public static function serializeStarlingPex(config:flight._js.ParticleEmitterConfig, existing:flight._js.StarlingPexDocument, options:flight._js.StarlingPexSerializeOptions):String;
	@:native("flight_serialize_starling_pex_document")
	public static function serializeStarlingPexDocument(config:flight._js.ParticleEmitterConfig, existing:flight._js.StarlingPexDocument, options:flight._js.StarlingPexSerializeOptions):flight._js.ParticleSerializeResult;
	@:native("flight_parse_unity_particle")
	public static function parseUnityParticle(json:String, options:flight._js.UnityParseOptions):flight._js.ParticleEmitterConfig;
	@:native("flight_parse_unity_particle_document")
	public static function parseUnityParticleDocument(json:String, options:flight._js.UnityParseOptions):flight._js.UnityParseResult;
	@:native("flight_serialize_unity_particle")
	public static function serializeUnityParticle(config:flight._js.ParticleEmitterConfig, existing:flight._js.UnityParticleDocument, options:flight._js.UnitySerializeOptions):String;
	@:native("flight_serialize_unity_particle_document")
	public static function serializeUnityParticleDocument(config:flight._js.ParticleEmitterConfig, existing:flight._js.UnityParticleDocument, options:flight._js.UnitySerializeOptions):flight._js.ParticleSerializeResult;
	@:native("flight_free_particle_format_kind")
	public static function freeParticleFormatKind(ptr:flight._js.ParticleFormatKind):Void;
	@:native("flight_free_particle_format_registry")
	public static function freeParticleFormatRegistry(ptr:flight._js.ParticleFormatRegistry):Void;
	@:native("flight_free_particle_config_parse_result")
	public static function freeParticleConfigParseResult(ptr:flight._js.ParticleConfigParseResult):Void;
	@:native("flight_free_libgdx_parse_result")
	public static function freeLibgdxParseResult(ptr:flight._js.LibgdxParseResult):Void;
	@:native("flight_free_particle_serialize_result")
	public static function freeParticleSerializeResult(ptr:flight._js.ParticleSerializeResult):Void;
	@:native("flight_free_particle_designer_parse_result")
	public static function freeParticleDesignerParseResult(ptr:flight._js.ParticleDesignerParseResult):Void;
	@:native("flight_free_pixi_parse_result")
	public static function freePixiParseResult(ptr:flight._js.PixiParseResult):Void;
	@:native("flight_free_particle_format_descriptor")
	public static function freeParticleFormatDescriptor(ptr:flight._js.ParticleFormatDescriptor):Void;
	@:native("flight_free_spine_parse_result")
	public static function freeSpineParseResult(ptr:flight._js.SpineParseResult):Void;
	@:native("flight_free_starling_pex_parse_result")
	public static function freeStarlingPexParseResult(ptr:flight._js.StarlingPexParseResult):Void;
	@:native("flight_free_unity_parse_result")
	public static function freeUnityParseResult(ptr:flight._js.UnityParseResult):Void;
}
