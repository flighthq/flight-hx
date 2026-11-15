package flight._hl._fn;

extern class SpritesheetFormats {
	@:hlNative("flight", "flight_serialize_aseprite_spritesheet")
	public static function serializeAsepriteSpritesheet(data:flight._hl.SpritesheetData, existing:flight._hl.AsepriteDocument, options:flight._hl.AsepriteSerializeOptions):hl.Bytes;
	@:hlNative("flight", "flight_serialize_cocos_plist_spritesheet")
	public static function serializeCocosPlistSpritesheet(data:flight._hl.SpritesheetData, existing:flight._hl.CocosPlistDocument):hl.Bytes;
	@:hlNative("flight", "flight_format_libgdx_atlas")
	public static function formatLibgdxAtlas(data:flight._hl.SpritesheetData):hl.Bytes;
	@:hlNative("flight", "flight_create_spritesheet_format_registry")
	public static function createSpritesheetFormatRegistry():flight._hl.SpritesheetFormatRegistry;
	@:hlNative("flight", "flight_apply_spritesheet_import_options")
	public static function applySpritesheetImportOptions(registry:flight._hl.SpritesheetFormatRegistry, options:flight._hl.SpritesheetImportOptions):Void;
	@:hlNative("flight", "flight_aseprite_spritesheet_format")
	public static function asepriteSpritesheetFormat(registry:flight._hl.SpritesheetFormatRegistry):flight._hl.SpritesheetFormatDescriptor;
	@:hlNative("flight", "flight_cocos_plist_spritesheet_format")
	public static function cocosPlistSpritesheetFormat(registry:flight._hl.SpritesheetFormatRegistry):flight._hl.SpritesheetFormatDescriptor;
	@:hlNative("flight", "flight_detect_spritesheet_format")
	public static function detectSpritesheetFormat(registry:flight._hl.SpritesheetFormatRegistry, text:hl.Bytes):Dynamic;
	@:hlNative("flight", "flight_get_spritesheet_format_kinds")
	public static function getSpritesheetFormatKinds(out:Dynamic, registry:flight._hl.SpritesheetFormatRegistry):Void;
	@:hlNative("flight", "flight_libgdx_atlas_spritesheet_format")
	public static function libgdxAtlasSpritesheetFormat(registry:flight._hl.SpritesheetFormatRegistry):flight._hl.SpritesheetFormatDescriptor;
	@:hlNative("flight", "flight_parse_spritesheet")
	public static function parseSpritesheet(registry:flight._hl.SpritesheetFormatRegistry, text:hl.Bytes, formatKind:flight._hl.SpritesheetFormatKind, options:flight._hl.SpritesheetParseOptions):Dynamic;
	@:hlNative("flight", "flight_starling_spritesheet_format")
	public static function starlingSpritesheetFormat(registry:flight._hl.SpritesheetFormatRegistry):flight._hl.SpritesheetFormatDescriptor;
	@:hlNative("flight", "flight_texture_packer_spritesheet_format")
	public static function texturePackerSpritesheetFormat(registry:flight._hl.SpritesheetFormatRegistry):flight._hl.SpritesheetFormatDescriptor;
	@:hlNative("flight", "flight_unregister_spritesheet_format")
	public static function unregisterSpritesheetFormat(registry:flight._hl.SpritesheetFormatRegistry, kind:flight._hl.SpritesheetFormatKind):Void;
	@:hlNative("flight", "flight_serialize_starling_spritesheet")
	public static function serializeStarlingSpritesheet(data:flight._hl.SpritesheetData, existing:flight._hl.StarlingDocument):hl.Bytes;
	@:hlNative("flight", "flight_serialize_texture_packer_spritesheet")
	public static function serializeTexturePackerSpritesheet(data:flight._hl.SpritesheetData, existing:flight._hl.TexturePackerDocument, options:flight._hl.TexturePackerSerializeOptions):hl.Bytes;
	@:hlNative("flight", "flight_free_spritesheet_format_registry")
	public static function freeSpritesheetFormatRegistry(ptr:flight._hl.SpritesheetFormatRegistry):Void;
	@:hlNative("flight", "flight_free_spritesheet_format_kind")
	public static function freeSpritesheetFormatKind(ptr:flight._hl.SpritesheetFormatKind):Void;
}
