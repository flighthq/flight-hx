package flight._js._fn;

@:jsRequire("@flighthq/text-markup")
extern class TextMarkup {
	@:native("resolveMarkupHexColor")
	public static function resolveMarkupHexColor(value:String):Null<Int>;
	@:native("formatTextMarkup")
	public static function formatTextMarkup(content:flight._js.RichTextContent):String;
}
