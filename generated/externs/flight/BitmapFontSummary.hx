package flight;

#if hl

typedef BitmapFontSummary = flight._hl.BitmapFontSummary;

#elseif cpp

typedef BitmapFontSummary = flight._cpp.BitmapFontSummary;

#elseif (js && flight_esm)

typedef BitmapFontSummary = flight._js.BitmapFontSummary;

#elseif js

#error "flight.BitmapFontSummary on js requires flight_esm."

#else

#error "flight.BitmapFontSummary: no backend for this target."

#end
