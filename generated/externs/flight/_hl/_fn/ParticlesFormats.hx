package flight._hl._fn;

extern class ParticlesFormats {
	@:hlNative("flight", "flight_detect_particle_format")
	public static function detectParticleFormat(registry:flight._hl.ParticleFormatRegistry, text:hl.Bytes):Dynamic;
	@:hlNative("flight", "flight_create_particle_format_registry")
	public static function createParticleFormatRegistry():flight._hl.ParticleFormatRegistry;
	@:hlNative("flight", "flight_detect_registered_particle_format")
	public static function detectRegisteredParticleFormat(registry:flight._hl.ParticleFormatRegistry, text:hl.Bytes):Dynamic;
	@:hlNative("flight", "flight_get_registered_particle_formats")
	public static function getRegisteredParticleFormats(out:Dynamic, registry:flight._hl.ParticleFormatRegistry):Void;
	@:hlNative("flight", "flight_parse_registered_particle_format")
	public static function parseRegisteredParticleFormat(registry:flight._hl.ParticleFormatRegistry, text:hl.Bytes, kind:hl.Bytes, options:flight._hl.ParseParticleConfigOptions):flight._hl.ParticleConfigParseResult;
	@:hlNative("flight", "flight_register_particle_format")
	public static function registerParticleFormat(registry:flight._hl.ParticleFormatRegistry, kind:hl.Bytes, codec:flight._hl.ParticleFormatCodec):Void;
	@:hlNative("flight", "flight_unregister_particle_format")
	public static function unregisterParticleFormat(registry:flight._hl.ParticleFormatRegistry, kind:hl.Bytes):Bool;
	@:hlNative("flight", "flight_parse_libgdx_particle")
	public static function parseLibgdxParticle(text:hl.Bytes, options:flight._hl.LibgdxParseOptions):flight._hl.ParticleEmitterConfig;
	@:hlNative("flight", "flight_parse_libgdx_particle_document")
	public static function parseLibgdxParticleDocument(text:hl.Bytes, options:flight._hl.LibgdxParseOptions):flight._hl.LibgdxParseResult;
	@:hlNative("flight", "flight_serialize_libgdx_particle")
	public static function serializeLibgdxParticle(config:flight._hl.ParticleEmitterConfig, existing:flight._hl.LibgdxParticleDocument, options:flight._hl.LibgdxSerializeOptions):hl.Bytes;
	@:hlNative("flight", "flight_serialize_libgdx_particle_document")
	public static function serializeLibgdxParticleDocument(config:flight._hl.ParticleEmitterConfig, existing:flight._hl.LibgdxParticleDocument, options:flight._hl.LibgdxSerializeOptions):flight._hl.ParticleSerializeResult;
	@:hlNative("flight", "flight_parse_particle_config")
	public static function parseParticleConfig(registry:flight._hl.ParticleFormatRegistry, text:hl.Bytes, options:flight._hl.ParseParticleConfigOptions):flight._hl.ParticleEmitterConfig;
	@:hlNative("flight", "flight_parse_particle_config_document")
	public static function parseParticleConfigDocument(registry:flight._hl.ParticleFormatRegistry, text:hl.Bytes, options:flight._hl.ParseParticleConfigOptions):flight._hl.ParticleConfigParseResult;
	@:hlNative("flight", "flight_parse_particle_designer_plist")
	public static function parseParticleDesignerPlist(plistXml:hl.Bytes, options:flight._hl.ParticleDesignerParseOptions):flight._hl.ParticleEmitterConfig;
	@:hlNative("flight", "flight_parse_particle_designer_plist_document")
	public static function parseParticleDesignerPlistDocument(plistXml:hl.Bytes, options:flight._hl.ParticleDesignerParseOptions):flight._hl.ParticleDesignerParseResult;
	@:hlNative("flight", "flight_serialize_particle_designer_plist")
	public static function serializeParticleDesignerPlist(config:flight._hl.ParticleEmitterConfig, existing:flight._hl.ParticleDesignerDocument, options:flight._hl.ParticleDesignerSerializeOptions):hl.Bytes;
	@:hlNative("flight", "flight_serialize_particle_designer_plist_document")
	public static function serializeParticleDesignerPlistDocument(config:flight._hl.ParticleEmitterConfig, existing:flight._hl.ParticleDesignerDocument, options:flight._hl.ParticleDesignerSerializeOptions):flight._hl.ParticleSerializeResult;
	@:hlNative("flight", "flight_parse_pixi_particle")
	public static function parsePixiParticle(json:hl.Bytes):flight._hl.ParticleEmitterConfig;
	@:hlNative("flight", "flight_parse_pixi_particle_document")
	public static function parsePixiParticleDocument(json:hl.Bytes):flight._hl.PixiParseResult;
	@:hlNative("flight", "flight_create_particle_all_formats")
	public static function createParticleAllFormats():Dynamic;
	@:hlNative("flight", "flight_apply_particle_import_options")
	public static function applyParticleImportOptions(registry:flight._hl.ParticleFormatRegistry, options:flight._hl.ParticleImportOptions):Void;
	@:hlNative("flight", "flight_get_libgdx_particle_format")
	public static function getLibgdxParticleFormat():flight._hl.ParticleFormatDescriptor;
	@:hlNative("flight", "flight_get_particle_designer_particle_format")
	public static function getParticleDesignerParticleFormat():flight._hl.ParticleFormatDescriptor;
	@:hlNative("flight", "flight_get_pixi_particle_format")
	public static function getPixiParticleFormat():flight._hl.ParticleFormatDescriptor;
	@:hlNative("flight", "flight_get_spine_particle_format")
	public static function getSpineParticleFormat():flight._hl.ParticleFormatDescriptor;
	@:hlNative("flight", "flight_get_starling_pex_particle_format")
	public static function getStarlingPexParticleFormat():flight._hl.ParticleFormatDescriptor;
	@:hlNative("flight", "flight_get_unity_particle_format")
	public static function getUnityParticleFormat():flight._hl.ParticleFormatDescriptor;
	@:hlNative("flight", "flight_register_built_in_particle_formats")
	public static function registerBuiltInParticleFormats(registry:flight._hl.ParticleFormatRegistry):Void;
	@:hlNative("flight", "flight_parse_spine_particle")
	public static function parseSpineParticle(json:hl.Bytes):flight._hl.ParticleEmitterConfig;
	@:hlNative("flight", "flight_parse_spine_particle_document")
	public static function parseSpineParticleDocument(json:hl.Bytes):flight._hl.SpineParseResult;
	@:hlNative("flight", "flight_serialize_spine_particle")
	public static function serializeSpineParticle(config:flight._hl.ParticleEmitterConfig, existing:flight._hl.SpineParticleDocument):hl.Bytes;
	@:hlNative("flight", "flight_serialize_spine_particle_document")
	public static function serializeSpineParticleDocument(config:flight._hl.ParticleEmitterConfig, existing:flight._hl.SpineParticleDocument):flight._hl.ParticleSerializeResult;
	@:hlNative("flight", "flight_parse_starling_pex")
	public static function parseStarlingPex(xml:hl.Bytes, options:flight._hl.StarlingPexParseOptions):flight._hl.ParticleEmitterConfig;
	@:hlNative("flight", "flight_parse_starling_pex_document")
	public static function parseStarlingPexDocument(xml:hl.Bytes, options:flight._hl.StarlingPexParseOptions):flight._hl.StarlingPexParseResult;
	@:hlNative("flight", "flight_serialize_starling_pex")
	public static function serializeStarlingPex(config:flight._hl.ParticleEmitterConfig, existing:flight._hl.StarlingPexDocument, options:flight._hl.StarlingPexSerializeOptions):hl.Bytes;
	@:hlNative("flight", "flight_serialize_starling_pex_document")
	public static function serializeStarlingPexDocument(config:flight._hl.ParticleEmitterConfig, existing:flight._hl.StarlingPexDocument, options:flight._hl.StarlingPexSerializeOptions):flight._hl.ParticleSerializeResult;
	@:hlNative("flight", "flight_parse_unity_particle")
	public static function parseUnityParticle(json:hl.Bytes, options:flight._hl.UnityParseOptions):flight._hl.ParticleEmitterConfig;
	@:hlNative("flight", "flight_parse_unity_particle_document")
	public static function parseUnityParticleDocument(json:hl.Bytes, options:flight._hl.UnityParseOptions):flight._hl.UnityParseResult;
	@:hlNative("flight", "flight_serialize_unity_particle")
	public static function serializeUnityParticle(config:flight._hl.ParticleEmitterConfig, existing:flight._hl.UnityParticleDocument, options:flight._hl.UnitySerializeOptions):hl.Bytes;
	@:hlNative("flight", "flight_serialize_unity_particle_document")
	public static function serializeUnityParticleDocument(config:flight._hl.ParticleEmitterConfig, existing:flight._hl.UnityParticleDocument, options:flight._hl.UnitySerializeOptions):flight._hl.ParticleSerializeResult;
	@:hlNative("flight", "flight_free_particle_format_kind")
	public static function freeParticleFormatKind(ptr:flight._hl.ParticleFormatKind):Void;
	@:hlNative("flight", "flight_free_particle_format_registry")
	public static function freeParticleFormatRegistry(ptr:flight._hl.ParticleFormatRegistry):Void;
	@:hlNative("flight", "flight_free_particle_config_parse_result")
	public static function freeParticleConfigParseResult(ptr:flight._hl.ParticleConfigParseResult):Void;
	@:hlNative("flight", "flight_free_libgdx_parse_result")
	public static function freeLibgdxParseResult(ptr:flight._hl.LibgdxParseResult):Void;
	@:hlNative("flight", "flight_free_particle_serialize_result")
	public static function freeParticleSerializeResult(ptr:flight._hl.ParticleSerializeResult):Void;
	@:hlNative("flight", "flight_free_particle_designer_parse_result")
	public static function freeParticleDesignerParseResult(ptr:flight._hl.ParticleDesignerParseResult):Void;
	@:hlNative("flight", "flight_free_pixi_parse_result")
	public static function freePixiParseResult(ptr:flight._hl.PixiParseResult):Void;
	@:hlNative("flight", "flight_free_particle_format_descriptor")
	public static function freeParticleFormatDescriptor(ptr:flight._hl.ParticleFormatDescriptor):Void;
	@:hlNative("flight", "flight_free_spine_parse_result")
	public static function freeSpineParseResult(ptr:flight._hl.SpineParseResult):Void;
	@:hlNative("flight", "flight_free_starling_pex_parse_result")
	public static function freeStarlingPexParseResult(ptr:flight._hl.StarlingPexParseResult):Void;
	@:hlNative("flight", "flight_free_unity_parse_result")
	public static function freeUnityParseResult(ptr:flight._hl.UnityParseResult):Void;
}
