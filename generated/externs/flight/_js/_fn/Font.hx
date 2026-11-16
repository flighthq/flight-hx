package flight._js._fn;

@:jsRequire("@flighthq/font")
extern class Font {
	@:native("inferFontFormatFromUrl")
	public static function inferFontFormatFromUrl(url:String):Null<String>;
	@:native("createFontResource")
	public static function createFontResource():flight._js.FontResource;
	@:native("getFontShorthand")
	public static function getFontShorthand(family:String, style:Null<String>):String;
	@:native("isFontLoaded")
	public static function isFontLoaded(backend:flight._js.HostFontLoadingCapability, family:String, style:Null<String>):Bool;
	@:native("getGlyphRasterizerOperationString")
	public static function getGlyphRasterizerOperationString(value:Dynamic):String;
	@:native("parseGlyphRasterizerOperation")
	public static function parseGlyphRasterizerOperation(value:String):Null<Dynamic>;
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeFontResource(ptr:flight._js.FontResource):Void {}
}
