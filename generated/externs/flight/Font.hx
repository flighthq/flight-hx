package flight;

inline function inferFontFormatFromUrl(url:String):String {
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
inline function createFontResource():FontResource {
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
inline function getFontShorthand(family:String, style:String):String {
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
inline function isFontLoaded(backend:HostFontLoadingCapability, family:String, style:String):Bool {
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
inline function getGlyphRasterizerOperationString(value:flight.GlyphRasterizerOperation):String {
#if hl
	return cast flight._hl._fn.Font.getGlyphRasterizerOperationString(value);
#elseif cpp
	return cast flight._cpp._fn.Font.getGlyphRasterizerOperationString(value);
#elseif (js && flight_esm)
	return cast flight._js._fn.Font.getGlyphRasterizerOperationString(value);
#else
	#error "flight.Font: no backend for this target."
#end
}
inline function parseGlyphRasterizerOperation(value:String):Int {
#if hl
	return flight._hl._fn.Font.parseGlyphRasterizerOperation(cast value);
#elseif cpp
	return flight._cpp._fn.Font.parseGlyphRasterizerOperation(cast value);
#elseif (js && flight_esm)
	return flight._js._fn.Font.parseGlyphRasterizerOperation(value);
#else
	#error "flight.Font: no backend for this target."
#end
}
inline function freeFontResource(ptr:FontResource):Void {
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
