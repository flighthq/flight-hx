package flight._cpp._fn;

extern class Intl {
	@:native("flight_compare_strings")
	public static function compareStrings(cache:flight._cpp.FormatterCache, host:flight._cpp.HostIntlCapability, a:cpp.ConstCharStar, b:cpp.ConstCharStar, locale:flight._cpp.LocaleInput, options:flight._cpp.CollatorOptions):Float;
	@:native("flight_sort_strings")
	public static function sortStrings(out:cpp.Star<cpp.Void>, cache:flight._cpp.FormatterCache, host:flight._cpp.HostIntlCapability, items:cpp.Star<cpp.Void>, itemsLen:Int, locale:flight._cpp.LocaleInput, options:flight._cpp.CollatorOptions):Void;
	@:native("flight_format_list")
	public static function formatList(cache:flight._cpp.FormatterCache, host:flight._cpp.HostIntlCapability, items:cpp.Star<cpp.Void>, itemsLen:Int, locale:flight._cpp.LocaleInput, options:flight._cpp.ListFormatOptions):cpp.ConstCharStar;
}
