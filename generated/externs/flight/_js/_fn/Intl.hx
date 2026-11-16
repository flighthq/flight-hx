package flight._js._fn;

@:jsRequire("@flighthq/intl")
extern class Intl {
	@:native("compareStrings")
	public static function compareStrings(cache:flight._js.FormatterCache, host:flight._js.HostIntlCapability, a:String, b:String, locale:flight._js.LocaleInput, options:Null<flight._js.CollatorOptions>):Float;
	@:native("sortStrings")
	public static function sortStrings(out:Dynamic, cache:flight._js.FormatterCache, host:flight._js.HostIntlCapability, items:Dynamic, locale:flight._js.LocaleInput, options:Null<flight._js.CollatorOptions>):Void;
	@:native("formatList")
	public static function formatList(cache:flight._js.FormatterCache, host:flight._js.HostIntlCapability, items:Dynamic, locale:flight._js.LocaleInput, options:Null<flight._js.ListFormatOptions>):String;
}
