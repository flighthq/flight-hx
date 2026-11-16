package flight;

#if (js && flight_esm)
extern inline function compareStrings(cache:FormatterCache, host:HostIntlCapability, a:String, b:String, locale:LocaleInput, options:Null<CollatorOptions>):Float {
	return flight._js._fn.Intl.compareStrings(cache, host, a, b, locale, options);
}
#else
extern inline function compareStrings(cache:FormatterCache, host:HostIntlCapability, a:String, b:String, locale:LocaleInput, options:CollatorOptions):Float {
#if hl
	return flight._hl._fn.Intl.compareStrings(cache, host, cast a, cast b, locale, options);
#elseif cpp
	return flight._cpp._fn.Intl.compareStrings(cache, host, cast a, cast b, locale, options);
#elseif (js && flight_esm)
	return flight._js._fn.Intl.compareStrings(cache, host, a, b, locale, options);
#else
	#error "flight.Intl: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function sortStrings(out:Dynamic, cache:FormatterCache, host:HostIntlCapability, items:Dynamic, locale:LocaleInput, options:Null<CollatorOptions>):Void {
	flight._js._fn.Intl.sortStrings(out, cache, host, items, locale, options);
}
#else
extern inline function sortStrings(out:Dynamic, cache:FormatterCache, host:HostIntlCapability, items:Dynamic, itemsLen:Int, locale:LocaleInput, options:CollatorOptions):Void {
#if hl
	flight._hl._fn.Intl.sortStrings(out, cache, host, items, itemsLen, locale, options);
#elseif cpp
	flight._cpp._fn.Intl.sortStrings(out, cache, host, items, itemsLen, locale, options);
#elseif (js && flight_esm)
	flight._js._fn.Intl.sortStrings(out, cache, host, items, itemsLen, locale, options);
#else
	#error "flight.Intl: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function formatList(cache:FormatterCache, host:HostIntlCapability, items:Dynamic, locale:LocaleInput, options:Null<ListFormatOptions>):String {
	return flight._js._fn.Intl.formatList(cache, host, items, locale, options);
}
#else
extern inline function formatList(cache:FormatterCache, host:HostIntlCapability, items:Dynamic, itemsLen:Int, locale:LocaleInput, options:ListFormatOptions):String {
#if hl
	return cast flight._hl._fn.Intl.formatList(cache, host, items, itemsLen, locale, options);
#elseif cpp
	return cast flight._cpp._fn.Intl.formatList(cache, host, items, itemsLen, locale, options);
#elseif (js && flight_esm)
	return cast flight._js._fn.Intl.formatList(cache, host, items, itemsLen, locale, options);
#else
	#error "flight.Intl: no backend for this target."
#end
}
#end
