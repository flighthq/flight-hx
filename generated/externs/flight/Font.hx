package flight;

#if (js && flight_esm)
extern inline function inferFontFormatFromUrl(url:String):Null<String> {
	return flight._js._fn.Font.inferFontFormatFromUrl(url);
}
#else
extern inline function inferFontFormatFromUrl(url:String):String {
#if hl
	return cast flight._hl._fn.Font.inferFontFormatFromUrl(cast url);
#elseif cpp
	return cast flight._cpp._fn.Font.inferFontFormatFromUrl(cast url);
#elseif (js && flight_esm)
	return cast flight._js._fn.Font.inferFontFormatFromUrl(url);
#else
	#error "flight.Font: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createFontResource(family:String):FontResource {
	return flight._js._fn.Font.createFontResource(family);
}
#else
extern inline function createFontResource():FontResource {
#if hl
	return flight._hl._fn.Font.createFontResource();
#elseif cpp
	return flight._cpp._fn.Font.createFontResource();
#elseif (js && flight_esm)
	return flight._js._fn.Font.createFontResource();
#else
	#error "flight.Font: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getFontShorthand(family:String, style:Null<String>):String {
	return flight._js._fn.Font.getFontShorthand(family, style);
}
#else
extern inline function getFontShorthand(family:String, style:String):String {
#if hl
	return cast flight._hl._fn.Font.getFontShorthand(cast family, cast style);
#elseif cpp
	return cast flight._cpp._fn.Font.getFontShorthand(cast family, cast style);
#elseif (js && flight_esm)
	return cast flight._js._fn.Font.getFontShorthand(family, style);
#else
	#error "flight.Font: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function isFontLoaded(backend:HostFontLoadingCapability, family:String, style:Null<String>):Bool {
	return flight._js._fn.Font.isFontLoaded(backend, family, style);
}
#else
extern inline function isFontLoaded(backend:HostFontLoadingCapability, family:String, style:String):Bool {
#if hl
	return flight._hl._fn.Font.isFontLoaded(backend, cast family, cast style);
#elseif cpp
	return flight._cpp._fn.Font.isFontLoaded(backend, cast family, cast style);
#elseif (js && flight_esm)
	return flight._js._fn.Font.isFontLoaded(backend, family, style);
#else
	#error "flight.Font: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeFontResource(ptr:FontResource):Void {
	flight._js._fn.Font.freeFontResource(ptr);
}
#else
extern inline function freeFontResource(ptr:FontResource):Void {
#if hl
	flight._hl._fn.Font.freeFontResource(ptr);
#elseif cpp
	flight._cpp._fn.Font.freeFontResource(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Font.freeFontResource(ptr);
#else
	#error "flight.Font: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeGlyphMetrics(ptr:GlyphMetrics):Void {
	flight._js._fn.Font.freeGlyphMetrics(ptr);
}
#else
extern inline function freeGlyphMetrics(ptr:GlyphMetrics):Void {
#if hl
	flight._hl._fn.Font.freeGlyphMetrics(ptr);
#elseif cpp
	flight._cpp._fn.Font.freeGlyphMetrics(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Font.freeGlyphMetrics(ptr);
#else
	#error "flight.Font: no backend for this target."
#end
}
#end
