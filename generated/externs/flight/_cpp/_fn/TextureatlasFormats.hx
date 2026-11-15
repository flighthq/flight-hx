package flight._cpp._fn;

extern class TextureatlasFormats {
	@:native("flight_parse_texture_atlas_aseprite_document")
	public static function parseTextureAtlasAsepriteDocument(atlas:flight._cpp.TextureAtlas, doc:flight._cpp.TextureAtlasAsepriteDocument):Void;
	@:native("flight_parse_texture_atlas_aseprite_json")
	public static function parseTextureAtlasAsepriteJson(atlas:flight._cpp.TextureAtlas, json:cpp.ConstCharStar):Void;
	@:native("flight_create_texture_atlas_format_registry")
	public static function createTextureAtlasFormatRegistry():flight._cpp.TextureAtlasFormatRegistry;
	@:native("flight_apply_texture_atlas_import_options")
	public static function applyTextureAtlasImportOptions(registry:flight._cpp.TextureAtlasFormatRegistry, options:flight._cpp.TextureAtlasImportOptions):Void;
	@:native("flight_aseprite_texture_atlas_format")
	public static function asepriteTextureAtlasFormat(registry:flight._cpp.TextureAtlasFormatRegistry):flight._cpp.TextureAtlasFormatDescriptor;
	@:native("flight_detect_texture_atlas_format")
	public static function detectTextureAtlasFormat(registry:flight._cpp.TextureAtlasFormatRegistry, content:cpp.ConstCharStar):flight._cpp.TextureAtlasFormatKind;
	@:native("flight_get_texture_atlas_format_kinds")
	public static function getTextureAtlasFormatKinds(out:cpp.Star<cpp.Void>, registry:flight._cpp.TextureAtlasFormatRegistry):Void;
	@:native("flight_libgdx_atlas_texture_atlas_format")
	public static function libgdxAtlasTextureAtlasFormat(registry:flight._cpp.TextureAtlasFormatRegistry):flight._cpp.TextureAtlasFormatDescriptor;
	@:native("flight_parse_texture_atlas")
	public static function parseTextureAtlas(atlas:flight._cpp.TextureAtlas, registry:flight._cpp.TextureAtlasFormatRegistry, content:cpp.ConstCharStar, formatKind:flight._cpp.TextureAtlasFormatKind, options:flight._cpp.TextureAtlasParseOptions):Bool;
	@:native("flight_starling_texture_atlas_format")
	public static function starlingTextureAtlasFormat(registry:flight._cpp.TextureAtlasFormatRegistry):flight._cpp.TextureAtlasFormatDescriptor;
	@:native("flight_texture_packer_texture_atlas_format")
	public static function texturePackerTextureAtlasFormat(registry:flight._cpp.TextureAtlasFormatRegistry):flight._cpp.TextureAtlasFormatDescriptor;
	@:native("flight_unregister_texture_atlas_format")
	public static function unregisterTextureAtlasFormat(registry:flight._cpp.TextureAtlasFormatRegistry, kind:flight._cpp.TextureAtlasFormatKind):Void;
	@:native("flight_parse_texture_atlas_libgdx_atlas")
	public static function parseTextureAtlasLibgdxAtlas(atlas:flight._cpp.TextureAtlas, text:cpp.ConstCharStar):Void;
	@:native("flight_read_texture_atlas_scale")
	public static function readTextureAtlasScale(scale:flight._cpp.TextureAtlasScale):Single;
	@:native("flight_reset_texture_atlas_page_meta")
	public static function resetTextureAtlasPageMeta(atlas:flight._cpp.TextureAtlas):Void;
	@:native("flight_parse_texture_atlas_starling_xml")
	public static function parseTextureAtlasStarlingXml(atlas:flight._cpp.TextureAtlas, xml:cpp.ConstCharStar):Void;
	@:native("flight_parse_texture_packer_atlas_document")
	public static function parseTexturePackerAtlasDocument(atlas:flight._cpp.TextureAtlas, doc:flight._cpp.TexturePackerAtlasDocument, options:flight._cpp.TexturePackerAtlasParseOptions):Void;
	@:native("flight_parse_texture_packer_atlas_json")
	public static function parseTexturePackerAtlasJson(atlas:flight._cpp.TextureAtlas, json:cpp.ConstCharStar, options:flight._cpp.TexturePackerAtlasParseOptions):Void;
	@:native("flight_get_texture_atlas_frame_tag_direction_string")
	public static function getTextureAtlasFrameTagDirectionString(value:Int):cpp.ConstCharStar;
	@:native("flight_parse_texture_atlas_frame_tag_direction")
	public static function parseTextureAtlasFrameTagDirection(value:cpp.ConstCharStar):Int;
	@:native("flight_free_texture_atlas_format_registry")
	public static function freeTextureAtlasFormatRegistry(ptr:flight._cpp.TextureAtlasFormatRegistry):Void;
	@:native("flight_free_texture_atlas_format_kind")
	public static function freeTextureAtlasFormatKind(ptr:flight._cpp.TextureAtlasFormatKind):Void;
}
