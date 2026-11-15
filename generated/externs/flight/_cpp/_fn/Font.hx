package flight._cpp._fn;

extern class Font {
	@:native("flight_infer_font_format_from_url")
	public static function inferFontFormatFromUrl(url:cpp.ConstCharStar):cpp.ConstCharStar;
	@:native("flight_create_font_resource")
	public static function createFontResource():flight._cpp.FontResource;
	@:native("flight_get_font_shorthand")
	public static function getFontShorthand(family:cpp.ConstCharStar, style:cpp.ConstCharStar):cpp.ConstCharStar;
	@:native("flight_is_font_loaded")
	public static function isFontLoaded(backend:flight._cpp.HostFontLoadingCapability, family:cpp.ConstCharStar, style:cpp.ConstCharStar):Bool;
	@:native("flight_get_glyph_rasterizer_operation_string")
	public static function getGlyphRasterizerOperationString(value:Int):cpp.ConstCharStar;
	@:native("flight_parse_glyph_rasterizer_operation")
	public static function parseGlyphRasterizerOperation(value:cpp.ConstCharStar):Int;
	@:native("flight_free_font_resource")
	public static function freeFontResource(ptr:flight._cpp.FontResource):Void;
}
