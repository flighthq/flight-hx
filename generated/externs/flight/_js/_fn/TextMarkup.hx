package flight._js._fn;

@:jsRequire("flight")
extern class TextMarkup {
	@:native("flight_resolve_markup_hex_color")
	public static function resolveMarkupHexColor(value:String):haxe.Int64;
	@:native("flight_format_text_markup")
	public static function formatTextMarkup(content:flight._js.RichTextContent):String;
}
