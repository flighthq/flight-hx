package flight._cpp._fn;

extern class TextMarkup {
	@:native("flight_resolve_markup_hex_color")
	public static function resolveMarkupHexColor(value:cpp.ConstCharStar):Int;
	@:native("flight_format_text_markup")
	public static function formatTextMarkup(content:flight._cpp.RichTextContent):cpp.ConstCharStar;
}
