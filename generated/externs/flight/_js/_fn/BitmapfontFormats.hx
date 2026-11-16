package flight._js._fn;

@:jsRequire("@flighthq/bitmapfont-formats")
extern class BitmapfontFormats {
	@:native("readBitmapFontFormatKind")
	public static function readBitmapFontFormatKind(bytes:Dynamic):Null<flight._js.BitmapFontFormatKind>;
	@:native("explainBitmapFontParse")
	public static function explainBitmapFontParse(text:String, options:Null<flight._js.BitmapFontParseOptions>):flight._js.BitmapFontParseExplanation;
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeBitmapFontFormatKind(ptr:flight._js.BitmapFontFormatKind):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeBitmapFontParseExplanation(ptr:flight._js.BitmapFontParseExplanation):Void {}
}
