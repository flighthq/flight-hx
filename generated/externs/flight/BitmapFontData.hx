package flight;

#if hl

typedef BitmapFontData = flight._hl.BitmapFontData;

#elseif cpp

typedef BitmapFontData = flight._cpp.BitmapFontData;

#elseif (js && flight_esm)

typedef BitmapFontData = flight._js.BitmapFontData;

#elseif js

#error "flight.BitmapFontData on js requires flight_esm."

#else

#error "flight.BitmapFontData: no backend for this target."

#end
