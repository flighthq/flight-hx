package flight;

inline function readBitmapFontFormatKind(bytes:Dynamic, bytesLen:Int):BitmapFontFormatKind {
#if hl
	return flight._hl._fn.BitmapfontFormats.readBitmapFontFormatKind(bytes, bytesLen);
#elseif cpp
	return flight._cpp._fn.BitmapfontFormats.readBitmapFontFormatKind(bytes, bytesLen);
#elseif (js && flight_esm)
	return flight._js._fn.BitmapfontFormats.readBitmapFontFormatKind(bytes, bytesLen);
#else
	#error "flight.BitmapfontFormats: no backend for this target."
#end
}
inline function explainBitmapFontParse(text:String, options:BitmapFontParseOptions):BitmapFontParseExplanation {
#if hl
	return flight._hl._fn.BitmapfontFormats.explainBitmapFontParse(cast text, options);
#elseif cpp
	return flight._cpp._fn.BitmapfontFormats.explainBitmapFontParse(cast text, options);
#elseif (js && flight_esm)
	return flight._js._fn.BitmapfontFormats.explainBitmapFontParse(text, options);
#else
	#error "flight.BitmapfontFormats: no backend for this target."
#end
}
inline function freeBitmapFontFormatKind(ptr:BitmapFontFormatKind):Void {
#if hl
	flight._hl._fn.BitmapfontFormats.freeBitmapFontFormatKind(ptr);
#elseif cpp
	flight._cpp._fn.BitmapfontFormats.freeBitmapFontFormatKind(ptr);
#elseif (js && flight_esm)
	flight._js._fn.BitmapfontFormats.freeBitmapFontFormatKind(ptr);
#else
	#error "flight.BitmapfontFormats: no backend for this target."
#end
}
inline function freeBitmapFontParseExplanation(ptr:BitmapFontParseExplanation):Void {
#if hl
	flight._hl._fn.BitmapfontFormats.freeBitmapFontParseExplanation(ptr);
#elseif cpp
	flight._cpp._fn.BitmapfontFormats.freeBitmapFontParseExplanation(ptr);
#elseif (js && flight_esm)
	flight._js._fn.BitmapfontFormats.freeBitmapFontParseExplanation(ptr);
#else
	#error "flight.BitmapfontFormats: no backend for this target."
#end
}
