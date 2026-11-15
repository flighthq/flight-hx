package flight;

#if hl

typedef BitmapFontKerningPair = flight._hl.BitmapFontKerningPair;

#elseif cpp

typedef BitmapFontKerningPair = flight._cpp.BitmapFontKerningPair;

#elseif (js && flight_esm)

typedef BitmapFontKerningPair = flight._js.BitmapFontKerningPair;

#elseif js

#error "flight.BitmapFontKerningPair on js requires flight_esm."

#else

#error "flight.BitmapFontKerningPair: no backend for this target."

#end
