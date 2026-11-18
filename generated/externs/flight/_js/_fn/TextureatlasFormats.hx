package flight._js._fn;

@:jsRequire("@flighthq/textureatlas-formats")
extern class TextureatlasFormats {
	@:native("parseTextureAtlasAsepriteDocument")
	public static function parseTextureAtlasAsepriteDocument(atlas:flight._js.TextureAtlas, doc:flight._js.TextureAtlasAsepriteDocument):Void;
	@:native("parseTextureAtlasAsepriteJson")
	public static function parseTextureAtlasAsepriteJson(atlas:flight._js.TextureAtlas, json:String):Void;
	@:native("applyTextureAtlasImportOptions")
	public static function applyTextureAtlasImportOptions(registry:flight._js.TextureAtlasFormatRegistry, options:flight._js.TextureAtlasImportOptions):Void;
	@:native("asepriteTextureAtlasFormat")
	public static function asepriteTextureAtlasFormat(registry:flight._js.TextureAtlasFormatRegistry):flight._js.TextureAtlasFormatDescriptor;
	@:native("detectTextureAtlasFormat")
	public static function detectTextureAtlasFormat(registry:flight._js.TextureAtlasFormatRegistry, content:String):Null<flight._js.TextureAtlasFormatKind>;
	@:native("getTextureAtlasFormatKinds")
	public static function getTextureAtlasFormatKinds(out:Dynamic, registry:flight._js.TextureAtlasFormatRegistry):Void;
	@:native("libgdxAtlasTextureAtlasFormat")
	public static function libgdxAtlasTextureAtlasFormat(registry:flight._js.TextureAtlasFormatRegistry):flight._js.TextureAtlasFormatDescriptor;
	@:native("parseTextureAtlas")
	public static function parseTextureAtlas(atlas:flight._js.TextureAtlas, registry:flight._js.TextureAtlasFormatRegistry, content:String, formatKind:Null<flight._js.TextureAtlasFormatKind>, options:Null<flight._js.TextureAtlasParseOptions>):Bool;
	@:native("starlingTextureAtlasFormat")
	public static function starlingTextureAtlasFormat(registry:flight._js.TextureAtlasFormatRegistry):flight._js.TextureAtlasFormatDescriptor;
	@:native("texturePackerTextureAtlasFormat")
	public static function texturePackerTextureAtlasFormat(registry:flight._js.TextureAtlasFormatRegistry):flight._js.TextureAtlasFormatDescriptor;
	@:native("unregisterTextureAtlasFormat")
	public static function unregisterTextureAtlasFormat(registry:flight._js.TextureAtlasFormatRegistry, kind:flight._js.TextureAtlasFormatKind):Void;
	@:native("parseTextureAtlasLibgdxAtlas")
	public static function parseTextureAtlasLibgdxAtlas(atlas:flight._js.TextureAtlas, text:String):Void;
	@:native("readTextureAtlasScale")
	public static function readTextureAtlasScale(scale:Null<flight._js.TextureAtlasScale>):Float;
	@:native("resetTextureAtlasPageMeta")
	public static function resetTextureAtlasPageMeta(atlas:flight._js.TextureAtlas):Void;
	@:native("parseTextureAtlasStarlingXml")
	public static function parseTextureAtlasStarlingXml(atlas:flight._js.TextureAtlas, xml:String):Void;
	@:native("parseTexturePackerAtlasDocument")
	public static function parseTexturePackerAtlasDocument(atlas:flight._js.TextureAtlas, doc:flight._js.TexturePackerAtlasDocument, options:Null<flight._js.TexturePackerAtlasParseOptions>):Void;
	@:native("parseTexturePackerAtlasJson")
	public static function parseTexturePackerAtlasJson(atlas:flight._js.TextureAtlas, json:String, options:Null<flight._js.TexturePackerAtlasParseOptions>):Void;
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeTextureAtlasFormatKind(ptr:flight._js.TextureAtlasFormatKind):Void {}
}
