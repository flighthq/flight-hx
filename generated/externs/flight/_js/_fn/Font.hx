package flight._js._fn;

@:jsRequire("flight")
extern class Font {
	@:native("flight_infer_font_format_from_url")
	public static function inferFontFormatFromUrl(url:String):String;
	@:native("flight_create_font_resource")
	public static function createFontResource():flight._js.FontResource;
	@:native("flight_get_font_shorthand")
	public static function getFontShorthand(family:String, style:String):String;
	@:native("flight_is_font_loaded")
	public static function isFontLoaded(backend:flight._js.HostFontLoadingCapability, family:String, style:String):Bool;
	@:native("flight_get_glyph_rasterizer_operation_string")
	public static function getGlyphRasterizerOperationString(value:Int):String;
	@:native("flight_parse_glyph_rasterizer_operation")
	public static function parseGlyphRasterizerOperation(value:String):Int;
	@:native("flight_free_font_resource")
	public static function freeFontResource(ptr:flight._js.FontResource):Void;
}
