package flight;

#if hl

typedef BitmapFontParseExplanation = flight._hl.BitmapFontParseExplanation;

#elseif cpp

typedef BitmapFontParseExplanation = flight._cpp.BitmapFontParseExplanation;

#elseif (js && flight_esm)

typedef BitmapFontParseExplanation = flight._js.BitmapFontParseExplanation;

#elseif js

#error "flight.BitmapFontParseExplanation on js requires flight_esm."

#else

#error "flight.BitmapFontParseExplanation: no backend for this target."

#end
