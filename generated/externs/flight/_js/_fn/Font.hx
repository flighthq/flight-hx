package flight._js._fn;

@:jsRequire("@flighthq/font")
extern class Font {
	@:native("inferFontFormatFromUrl")
	public static function inferFontFormatFromUrl(url:String):Null<String>;
	@:native("createFontResource")
	public static function createFontResource(family:String):flight._js.FontResource;
	@:native("getFontShorthand")
	public static function getFontShorthand(family:String, style:Null<String>):String;
	@:native("isFontLoaded")
	public static function isFontLoaded(backend:flight._js.HostFontLoadingCapability, family:String, style:Null<String>):Bool;
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeFontResource(ptr:flight._js.FontResource):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeGlyphMetrics(ptr:flight._js.GlyphMetrics):Void {}
}
