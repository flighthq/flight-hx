package flight._js._fn;

@:jsRequire("flight")
extern class Intl {
	@:native("flight_compare_strings")
	public static function compareStrings(cache:flight._js.FormatterCache, host:flight._js.HostIntlCapability, a:String, b:String, locale:flight._js.LocaleInput, options:flight._js.CollatorOptions):Float;
	@:native("flight_sort_strings")
	public static function sortStrings(out:Dynamic, cache:flight._js.FormatterCache, host:flight._js.HostIntlCapability, items:Dynamic, itemsLen:Int, locale:flight._js.LocaleInput, options:flight._js.CollatorOptions):Void;
	@:native("flight_format_list")
	public static function formatList(cache:flight._js.FormatterCache, host:flight._js.HostIntlCapability, items:Dynamic, itemsLen:Int, locale:flight._js.LocaleInput, options:flight._js.ListFormatOptions):String;
}
