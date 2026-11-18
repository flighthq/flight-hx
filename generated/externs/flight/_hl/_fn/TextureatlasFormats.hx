package flight._hl._fn;

extern class TextureatlasFormats {
	@:hlNative("flight", "flight_parse_texture_atlas_aseprite_document")
	public static function parseTextureAtlasAsepriteDocument(atlas:flight._hl.TextureAtlas, doc:flight._hl.TextureAtlasAsepriteDocument):Void;
	@:hlNative("flight", "flight_parse_texture_atlas_aseprite_json")
	public static function parseTextureAtlasAsepriteJson(atlas:flight._hl.TextureAtlas, json:hl.Bytes):Void;
	@:hlNative("flight", "flight_apply_texture_atlas_import_options")
	public static function applyTextureAtlasImportOptions(registry:flight._hl.TextureAtlasFormatRegistry, options:flight._hl.TextureAtlasImportOptions):Void;
	@:hlNative("flight", "flight_aseprite_texture_atlas_format")
	public static function asepriteTextureAtlasFormat(registry:flight._hl.TextureAtlasFormatRegistry):flight._hl.TextureAtlasFormatDescriptor;
	@:hlNative("flight", "flight_detect_texture_atlas_format")
	public static function detectTextureAtlasFormat(registry:flight._hl.TextureAtlasFormatRegistry, content:hl.Bytes):flight._hl.TextureAtlasFormatKind;
	@:hlNative("flight", "flight_get_texture_atlas_format_kinds")
	public static function getTextureAtlasFormatKinds(out:hl.Bytes, registry:flight._hl.TextureAtlasFormatRegistry):Void;
	@:hlNative("flight", "flight_libgdx_atlas_texture_atlas_format")
	public static function libgdxAtlasTextureAtlasFormat(registry:flight._hl.TextureAtlasFormatRegistry):flight._hl.TextureAtlasFormatDescriptor;
	@:hlNative("flight", "flight_parse_texture_atlas")
	public static function parseTextureAtlas(atlas:flight._hl.TextureAtlas, registry:flight._hl.TextureAtlasFormatRegistry, content:hl.Bytes, formatKind:flight._hl.TextureAtlasFormatKind, options:flight._hl.TextureAtlasParseOptions):Bool;
	@:hlNative("flight", "flight_starling_texture_atlas_format")
	public static function starlingTextureAtlasFormat(registry:flight._hl.TextureAtlasFormatRegistry):flight._hl.TextureAtlasFormatDescriptor;
	@:hlNative("flight", "flight_texture_packer_texture_atlas_format")
	public static function texturePackerTextureAtlasFormat(registry:flight._hl.TextureAtlasFormatRegistry):flight._hl.TextureAtlasFormatDescriptor;
	@:hlNative("flight", "flight_unregister_texture_atlas_format")
	public static function unregisterTextureAtlasFormat(registry:flight._hl.TextureAtlasFormatRegistry, kind:flight._hl.TextureAtlasFormatKind):Void;
	@:hlNative("flight", "flight_parse_texture_atlas_libgdx_atlas")
	public static function parseTextureAtlasLibgdxAtlas(atlas:flight._hl.TextureAtlas, text:hl.Bytes):Void;
	@:hlNative("flight", "flight_read_texture_atlas_scale")
	public static function readTextureAtlasScale(scale:flight._hl.TextureAtlasScale):Single;
	@:hlNative("flight", "flight_reset_texture_atlas_page_meta")
	public static function resetTextureAtlasPageMeta(atlas:flight._hl.TextureAtlas):Void;
	@:hlNative("flight", "flight_parse_texture_atlas_starling_xml")
	public static function parseTextureAtlasStarlingXml(atlas:flight._hl.TextureAtlas, xml:hl.Bytes):Void;
	@:hlNative("flight", "flight_parse_texture_packer_atlas_document")
	public static function parseTexturePackerAtlasDocument(atlas:flight._hl.TextureAtlas, doc:flight._hl.TexturePackerAtlasDocument, options:flight._hl.TexturePackerAtlasParseOptions):Void;
	@:hlNative("flight", "flight_parse_texture_packer_atlas_json")
	public static function parseTexturePackerAtlasJson(atlas:flight._hl.TextureAtlas, json:hl.Bytes, options:flight._hl.TexturePackerAtlasParseOptions):Void;
	@:hlNative("flight", "flight_free_texture_atlas_format_kind")
	public static function freeTextureAtlasFormatKind(ptr:flight._hl.TextureAtlasFormatKind):Void;
}
