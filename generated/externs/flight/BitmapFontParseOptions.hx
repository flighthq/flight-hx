package flight;

#if hl

typedef BitmapFontParseOptions = flight._hl.BitmapFontParseOptions;

#elseif cpp

typedef BitmapFontParseOptions = flight._cpp.BitmapFontParseOptions;

#elseif (js && flight_esm)

typedef BitmapFontParseOptions = flight._js.BitmapFontParseOptions;

#elseif js

#error "flight.BitmapFontParseOptions on js requires flight_esm."

#else

#error "flight.BitmapFontParseOptions: no backend for this target."

#end
