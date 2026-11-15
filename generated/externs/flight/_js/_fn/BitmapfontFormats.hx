package flight._js._fn;

@:jsRequire("flight")
extern class BitmapfontFormats {
	@:native("flight_read_bitmap_font_format_kind")
	public static function readBitmapFontFormatKind(bytes:Dynamic, bytesLen:Int):Dynamic;
	@:native("flight_explain_bitmap_font_parse")
	public static function explainBitmapFontParse(text:String, options:flight._js.BitmapFontParseOptions):flight._js.BitmapFontParseExplanation;
	@:native("flight_free_bitmap_font_format_kind")
	public static function freeBitmapFontFormatKind(ptr:flight._js.BitmapFontFormatKind):Void;
	@:native("flight_free_bitmap_font_parse_explanation")
	public static function freeBitmapFontParseExplanation(ptr:flight._js.BitmapFontParseExplanation):Void;
}
