package flight;

#if hl

typedef BitmapFontKerningData = flight._hl.BitmapFontKerningData;

#elseif cpp

typedef BitmapFontKerningData = flight._cpp.BitmapFontKerningData;

#elseif (js && flight_esm)

typedef BitmapFontKerningData = flight._js.BitmapFontKerningData;

#elseif js

#error "flight.BitmapFontKerningData on js requires flight_esm."

#else

#error "flight.BitmapFontKerningData: no backend for this target."

#end
