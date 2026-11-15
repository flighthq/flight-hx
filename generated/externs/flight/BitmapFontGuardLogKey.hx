package flight;

#if hl

typedef BitmapFontGuardLogKey = flight._hl.BitmapFontGuardLogKey;

#elseif cpp

typedef BitmapFontGuardLogKey = flight._cpp.BitmapFontGuardLogKey;

#elseif (js && flight_esm)

typedef BitmapFontGuardLogKey = flight._js.BitmapFontGuardLogKey;

#elseif js

#error "flight.BitmapFontGuardLogKey on js requires flight_esm."

#else

#error "flight.BitmapFontGuardLogKey: no backend for this target."

#end
