package flight._js._fn;

@:jsRequire("flight")
extern class SpritesheetFormats {
	@:native("flight_serialize_aseprite_spritesheet")
	public static function serializeAsepriteSpritesheet(data:flight._js.SpritesheetData, existing:flight._js.AsepriteDocument, options:flight._js.AsepriteSerializeOptions):String;
	@:native("flight_serialize_cocos_plist_spritesheet")
	public static function serializeCocosPlistSpritesheet(data:flight._js.SpritesheetData, existing:flight._js.CocosPlistDocument):String;
	@:native("flight_format_libgdx_atlas")
	public static function formatLibgdxAtlas(data:flight._js.SpritesheetData):String;
	@:native("flight_create_spritesheet_format_registry")
	public static function createSpritesheetFormatRegistry():flight._js.SpritesheetFormatRegistry;
	@:native("flight_apply_spritesheet_import_options")
	public static function applySpritesheetImportOptions(registry:flight._js.SpritesheetFormatRegistry, options:flight._js.SpritesheetImportOptions):Void;
	@:native("flight_aseprite_spritesheet_format")
	public static function asepriteSpritesheetFormat(registry:flight._js.SpritesheetFormatRegistry):flight._js.SpritesheetFormatDescriptor;
	@:native("flight_cocos_plist_spritesheet_format")
	public static function cocosPlistSpritesheetFormat(registry:flight._js.SpritesheetFormatRegistry):flight._js.SpritesheetFormatDescriptor;
	@:native("flight_detect_spritesheet_format")
	public static function detectSpritesheetFormat(registry:flight._js.SpritesheetFormatRegistry, text:String):Dynamic;
	@:native("flight_get_spritesheet_format_kinds")
	public static function getSpritesheetFormatKinds(out:Dynamic, registry:flight._js.SpritesheetFormatRegistry):Void;
	@:native("flight_libgdx_atlas_spritesheet_format")
	public static function libgdxAtlasSpritesheetFormat(registry:flight._js.SpritesheetFormatRegistry):flight._js.SpritesheetFormatDescriptor;
	@:native("flight_parse_spritesheet")
	public static function parseSpritesheet(registry:flight._js.SpritesheetFormatRegistry, text:String, formatKind:flight._js.SpritesheetFormatKind, options:flight._js.SpritesheetParseOptions):Dynamic;
	@:native("flight_starling_spritesheet_format")
	public static function starlingSpritesheetFormat(registry:flight._js.SpritesheetFormatRegistry):flight._js.SpritesheetFormatDescriptor;
	@:native("flight_texture_packer_spritesheet_format")
	public static function texturePackerSpritesheetFormat(registry:flight._js.SpritesheetFormatRegistry):flight._js.SpritesheetFormatDescriptor;
	@:native("flight_unregister_spritesheet_format")
	public static function unregisterSpritesheetFormat(registry:flight._js.SpritesheetFormatRegistry, kind:flight._js.SpritesheetFormatKind):Void;
	@:native("flight_serialize_starling_spritesheet")
	public static function serializeStarlingSpritesheet(data:flight._js.SpritesheetData, existing:flight._js.StarlingDocument):String;
	@:native("flight_serialize_texture_packer_spritesheet")
	public static function serializeTexturePackerSpritesheet(data:flight._js.SpritesheetData, existing:flight._js.TexturePackerDocument, options:flight._js.TexturePackerSerializeOptions):String;
	@:native("flight_free_spritesheet_format_registry")
	public static function freeSpritesheetFormatRegistry(ptr:flight._js.SpritesheetFormatRegistry):Void;
	@:native("flight_free_spritesheet_format_kind")
	public static function freeSpritesheetFormatKind(ptr:flight._js.SpritesheetFormatKind):Void;
}
