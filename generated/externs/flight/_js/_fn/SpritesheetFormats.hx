package flight._js._fn;

@:jsRequire("@flighthq/spritesheet-formats")
extern class SpritesheetFormats {
	@:native("serializeAsepriteSpritesheet")
	public static function serializeAsepriteSpritesheet(data:flight._js.SpritesheetData, existing:Null<flight._js.AsepriteDocument>, options:Null<flight._js.AsepriteSerializeOptions>):String;
	@:native("serializeCocosPlistSpritesheet")
	public static function serializeCocosPlistSpritesheet(data:flight._js.SpritesheetData, existing:Null<flight._js.CocosPlistDocument>):String;
	@:native("formatLibgdxAtlas")
	public static function formatLibgdxAtlas(data:flight._js.SpritesheetData):String;
	@:native("createSpritesheetFormatRegistry")
	public static function createSpritesheetFormatRegistry():flight._js.SpritesheetFormatRegistry;
	@:native("applySpritesheetImportOptions")
	public static function applySpritesheetImportOptions(registry:flight._js.SpritesheetFormatRegistry, options:flight._js.SpritesheetImportOptions):Void;
	@:native("asepriteSpritesheetFormat")
	public static function asepriteSpritesheetFormat(registry:flight._js.SpritesheetFormatRegistry):flight._js.SpritesheetFormatDescriptor;
	@:native("cocosPlistSpritesheetFormat")
	public static function cocosPlistSpritesheetFormat(registry:flight._js.SpritesheetFormatRegistry):flight._js.SpritesheetFormatDescriptor;
	@:native("detectSpritesheetFormat")
	public static function detectSpritesheetFormat(registry:flight._js.SpritesheetFormatRegistry, text:String):Null<flight._js.SpritesheetFormatKind>;
	@:native("getSpritesheetFormatKinds")
	public static function getSpritesheetFormatKinds(out:Dynamic, registry:flight._js.SpritesheetFormatRegistry):Void;
	@:native("libgdxAtlasSpritesheetFormat")
	public static function libgdxAtlasSpritesheetFormat(registry:flight._js.SpritesheetFormatRegistry):flight._js.SpritesheetFormatDescriptor;
	@:native("parseSpritesheet")
	public static function parseSpritesheet(registry:flight._js.SpritesheetFormatRegistry, text:String, formatKind:Null<flight._js.SpritesheetFormatKind>, options:Null<flight._js.SpritesheetParseOptions>):Null<flight._js.SpritesheetData>;
	@:native("starlingSpritesheetFormat")
	public static function starlingSpritesheetFormat(registry:flight._js.SpritesheetFormatRegistry):flight._js.SpritesheetFormatDescriptor;
	@:native("texturePackerSpritesheetFormat")
	public static function texturePackerSpritesheetFormat(registry:flight._js.SpritesheetFormatRegistry):flight._js.SpritesheetFormatDescriptor;
	@:native("unregisterSpritesheetFormat")
	public static function unregisterSpritesheetFormat(registry:flight._js.SpritesheetFormatRegistry, kind:flight._js.SpritesheetFormatKind):Void;
	@:native("serializeStarlingSpritesheet")
	public static function serializeStarlingSpritesheet(data:flight._js.SpritesheetData, existing:Null<flight._js.StarlingDocument>):String;
	@:native("serializeTexturePackerSpritesheet")
	public static function serializeTexturePackerSpritesheet(data:flight._js.SpritesheetData, existing:Null<flight._js.TexturePackerDocument>, options:Null<flight._js.TexturePackerSerializeOptions>):String;
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeSpritesheetFormatRegistry(ptr:flight._js.SpritesheetFormatRegistry):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeSpritesheetFormatKind(ptr:flight._js.SpritesheetFormatKind):Void {}
}
