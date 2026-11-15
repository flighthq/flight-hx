package flight._cpp._fn;

extern class BitmapfontFormats {
	@:native("flight_read_bitmap_font_format_kind")
	public static function readBitmapFontFormatKind(bytes:cpp.Star<cpp.Void>, bytesLen:Int):flight._cpp.BitmapFontFormatKind;
	@:native("flight_explain_bitmap_font_parse")
	public static function explainBitmapFontParse(text:cpp.ConstCharStar, options:flight._cpp.BitmapFontParseOptions):flight._cpp.BitmapFontParseExplanation;
	@:native("flight_free_bitmap_font_format_kind")
	public static function freeBitmapFontFormatKind(ptr:flight._cpp.BitmapFontFormatKind):Void;
	@:native("flight_free_bitmap_font_parse_explanation")
	public static function freeBitmapFontParseExplanation(ptr:flight._cpp.BitmapFontParseExplanation):Void;
}
