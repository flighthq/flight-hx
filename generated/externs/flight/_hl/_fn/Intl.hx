package flight._hl._fn;

extern class Intl {
	@:hlNative("flight", "flight_compare_strings")
	public static function compareStrings(cache:flight._hl.FormatterCache, host:flight._hl.HostIntlCapability, a:hl.Bytes, b:hl.Bytes, locale:flight._hl.LocaleInput, options:flight._hl.CollatorOptions):Float;
	@:hlNative("flight", "flight_sort_strings")
	public static function sortStrings(out:Dynamic, cache:flight._hl.FormatterCache, host:flight._hl.HostIntlCapability, items:hl.Bytes, itemsLen:Int, locale:flight._hl.LocaleInput, options:flight._hl.CollatorOptions):Void;
	@:hlNative("flight", "flight_format_list")
	public static function formatList(cache:flight._hl.FormatterCache, host:flight._hl.HostIntlCapability, items:hl.Bytes, itemsLen:Int, locale:flight._hl.LocaleInput, options:flight._hl.ListFormatOptions):hl.Bytes;
}
