package flight;

#if hl

typedef BitmapFontFormatKind = flight._hl.BitmapFontFormatKind;

#elseif cpp

typedef BitmapFontFormatKind = flight._cpp.BitmapFontFormatKind;

#elseif (js && flight_esm)

typedef BitmapFontFormatKind = flight._js.BitmapFontFormatKind;

#elseif js

#error "flight.BitmapFontFormatKind on js requires flight_esm."

#else

#error "flight.BitmapFontFormatKind: no backend for this target."

#end
