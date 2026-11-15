package flight._cpp._fn;

extern class SpritesheetFormats {
	@:native("flight_serialize_aseprite_spritesheet")
	public static function serializeAsepriteSpritesheet(data:flight._cpp.SpritesheetData, existing:flight._cpp.AsepriteDocument, options:flight._cpp.AsepriteSerializeOptions):cpp.ConstCharStar;
	@:native("flight_serialize_cocos_plist_spritesheet")
	public static function serializeCocosPlistSpritesheet(data:flight._cpp.SpritesheetData, existing:flight._cpp.CocosPlistDocument):cpp.ConstCharStar;
	@:native("flight_format_libgdx_atlas")
	public static function formatLibgdxAtlas(data:flight._cpp.SpritesheetData):cpp.ConstCharStar;
	@:native("flight_create_spritesheet_format_registry")
	public static function createSpritesheetFormatRegistry():flight._cpp.SpritesheetFormatRegistry;
	@:native("flight_apply_spritesheet_import_options")
	public static function applySpritesheetImportOptions(registry:flight._cpp.SpritesheetFormatRegistry, options:flight._cpp.SpritesheetImportOptions):Void;
	@:native("flight_aseprite_spritesheet_format")
	public static function asepriteSpritesheetFormat(registry:flight._cpp.SpritesheetFormatRegistry):flight._cpp.SpritesheetFormatDescriptor;
	@:native("flight_cocos_plist_spritesheet_format")
	public static function cocosPlistSpritesheetFormat(registry:flight._cpp.SpritesheetFormatRegistry):flight._cpp.SpritesheetFormatDescriptor;
	@:native("flight_detect_spritesheet_format")
	public static function detectSpritesheetFormat(registry:flight._cpp.SpritesheetFormatRegistry, text:cpp.ConstCharStar):flight._cpp.SpritesheetFormatKind;
	@:native("flight_get_spritesheet_format_kinds")
	public static function getSpritesheetFormatKinds(out:cpp.Star<cpp.Void>, registry:flight._cpp.SpritesheetFormatRegistry):Void;
	@:native("flight_libgdx_atlas_spritesheet_format")
	public static function libgdxAtlasSpritesheetFormat(registry:flight._cpp.SpritesheetFormatRegistry):flight._cpp.SpritesheetFormatDescriptor;
	@:native("flight_parse_spritesheet")
	public static function parseSpritesheet(registry:flight._cpp.SpritesheetFormatRegistry, text:cpp.ConstCharStar, formatKind:flight._cpp.SpritesheetFormatKind, options:flight._cpp.SpritesheetParseOptions):flight._cpp.SpritesheetData;
	@:native("flight_starling_spritesheet_format")
	public static function starlingSpritesheetFormat(registry:flight._cpp.SpritesheetFormatRegistry):flight._cpp.SpritesheetFormatDescriptor;
	@:native("flight_texture_packer_spritesheet_format")
	public static function texturePackerSpritesheetFormat(registry:flight._cpp.SpritesheetFormatRegistry):flight._cpp.SpritesheetFormatDescriptor;
	@:native("flight_unregister_spritesheet_format")
	public static function unregisterSpritesheetFormat(registry:flight._cpp.SpritesheetFormatRegistry, kind:flight._cpp.SpritesheetFormatKind):Void;
	@:native("flight_serialize_starling_spritesheet")
	public static function serializeStarlingSpritesheet(data:flight._cpp.SpritesheetData, existing:flight._cpp.StarlingDocument):cpp.ConstCharStar;
	@:native("flight_serialize_texture_packer_spritesheet")
	public static function serializeTexturePackerSpritesheet(data:flight._cpp.SpritesheetData, existing:flight._cpp.TexturePackerDocument, options:flight._cpp.TexturePackerSerializeOptions):cpp.ConstCharStar;
	@:native("flight_free_spritesheet_format_registry")
	public static function freeSpritesheetFormatRegistry(ptr:flight._cpp.SpritesheetFormatRegistry):Void;
	@:native("flight_free_spritesheet_format_kind")
	public static function freeSpritesheetFormatKind(ptr:flight._cpp.SpritesheetFormatKind):Void;
}
