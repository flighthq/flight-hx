package flight._hl._fn;

extern class TextMarkup {
	@:hlNative("flight", "flight_resolve_markup_hex_color")
	public static function resolveMarkupHexColor(value:hl.Bytes):Int;
	@:hlNative("flight", "flight_format_text_markup")
	public static function formatTextMarkup(content:flight._hl.RichTextContent):hl.Bytes;
}
