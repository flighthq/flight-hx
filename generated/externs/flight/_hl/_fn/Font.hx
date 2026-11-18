package flight._hl._fn;

extern class Font {
	@:hlNative("flight", "flight_infer_font_format_from_url")
	public static function inferFontFormatFromUrl(url:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_create_font_resource")
	public static function createFontResource():flight._hl.FontResource;
	@:hlNative("flight", "flight_get_font_shorthand")
	public static function getFontShorthand(family:hl.Bytes, style:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_is_font_loaded")
	public static function isFontLoaded(backend:flight._hl.HostFontLoadingCapability, family:hl.Bytes, style:hl.Bytes):Bool;
	@:hlNative("flight", "flight_free_font_resource")
	public static function freeFontResource(ptr:flight._hl.FontResource):Void;
}
