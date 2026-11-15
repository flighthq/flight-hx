package flight._js._fn;

@:jsRequire("flight")
extern class TextureatlasFormats {
	@:native("flight_parse_texture_atlas_aseprite_document")
	public static function parseTextureAtlasAsepriteDocument(atlas:flight._js.TextureAtlas, doc:flight._js.TextureAtlasAsepriteDocument):Void;
	@:native("flight_parse_texture_atlas_aseprite_json")
	public static function parseTextureAtlasAsepriteJson(atlas:flight._js.TextureAtlas, json:String):Void;
	@:native("flight_create_texture_atlas_format_registry")
	public static function createTextureAtlasFormatRegistry():flight._js.TextureAtlasFormatRegistry;
	@:native("flight_apply_texture_atlas_import_options")
	public static function applyTextureAtlasImportOptions(registry:flight._js.TextureAtlasFormatRegistry, options:flight._js.TextureAtlasImportOptions):Void;
	@:native("flight_aseprite_texture_atlas_format")
	public static function asepriteTextureAtlasFormat(registry:flight._js.TextureAtlasFormatRegistry):flight._js.TextureAtlasFormatDescriptor;
	@:native("flight_detect_texture_atlas_format")
	public static function detectTextureAtlasFormat(registry:flight._js.TextureAtlasFormatRegistry, content:String):Dynamic;
	@:native("flight_get_texture_atlas_format_kinds")
	public static function getTextureAtlasFormatKinds(out:Dynamic, registry:flight._js.TextureAtlasFormatRegistry):Void;
	@:native("flight_libgdx_atlas_texture_atlas_format")
	public static function libgdxAtlasTextureAtlasFormat(registry:flight._js.TextureAtlasFormatRegistry):flight._js.TextureAtlasFormatDescriptor;
	@:native("flight_parse_texture_atlas")
	public static function parseTextureAtlas(atlas:flight._js.TextureAtlas, registry:flight._js.TextureAtlasFormatRegistry, content:String, formatKind:flight._js.TextureAtlasFormatKind, options:flight._js.TextureAtlasParseOptions):Bool;
	@:native("flight_starling_texture_atlas_format")
	public static function starlingTextureAtlasFormat(registry:flight._js.TextureAtlasFormatRegistry):flight._js.TextureAtlasFormatDescriptor;
	@:native("flight_texture_packer_texture_atlas_format")
	public static function texturePackerTextureAtlasFormat(registry:flight._js.TextureAtlasFormatRegistry):flight._js.TextureAtlasFormatDescriptor;
	@:native("flight_unregister_texture_atlas_format")
	public static function unregisterTextureAtlasFormat(registry:flight._js.TextureAtlasFormatRegistry, kind:flight._js.TextureAtlasFormatKind):Void;
	@:native("flight_parse_texture_atlas_libgdx_atlas")
	public static function parseTextureAtlasLibgdxAtlas(atlas:flight._js.TextureAtlas, text:String):Void;
	@:native("flight_read_texture_atlas_scale")
	public static function readTextureAtlasScale(scale:flight._js.TextureAtlasScale):Float;
	@:native("flight_reset_texture_atlas_page_meta")
	public static function resetTextureAtlasPageMeta(atlas:flight._js.TextureAtlas):Void;
	@:native("flight_parse_texture_atlas_starling_xml")
	public static function parseTextureAtlasStarlingXml(atlas:flight._js.TextureAtlas, xml:String):Void;
	@:native("flight_parse_texture_packer_atlas_document")
	public static function parseTexturePackerAtlasDocument(atlas:flight._js.TextureAtlas, doc:flight._js.TexturePackerAtlasDocument, options:flight._js.TexturePackerAtlasParseOptions):Void;
	@:native("flight_parse_texture_packer_atlas_json")
	public static function parseTexturePackerAtlasJson(atlas:flight._js.TextureAtlas, json:String, options:flight._js.TexturePackerAtlasParseOptions):Void;
	@:native("flight_get_texture_atlas_frame_tag_direction_string")
	public static function getTextureAtlasFrameTagDirectionString(value:Int):String;
	@:native("flight_parse_texture_atlas_frame_tag_direction")
	public static function parseTextureAtlasFrameTagDirection(value:String):Int;
	@:native("flight_free_texture_atlas_format_registry")
	public static function freeTextureAtlasFormatRegistry(ptr:flight._js.TextureAtlasFormatRegistry):Void;
	@:native("flight_free_texture_atlas_format_kind")
	public static function freeTextureAtlasFormatKind(ptr:flight._js.TextureAtlasFormatKind):Void;
}
