package flight._hl._fn;

extern class BitmapfontFormats {
	@:hlNative("flight", "flight_read_bitmap_font_format_kind")
	public static function readBitmapFontFormatKind(bytes:hl.Bytes, bytesLen:Int):Dynamic;
	@:hlNative("flight", "flight_explain_bitmap_font_parse")
	public static function explainBitmapFontParse(text:hl.Bytes, options:flight._hl.BitmapFontParseOptions):flight._hl.BitmapFontParseExplanation;
	@:hlNative("flight", "flight_free_bitmap_font_format_kind")
	public static function freeBitmapFontFormatKind(ptr:flight._hl.BitmapFontFormatKind):Void;
	@:hlNative("flight", "flight_free_bitmap_font_parse_explanation")
	public static function freeBitmapFontParseExplanation(ptr:flight._hl.BitmapFontParseExplanation):Void;
}
