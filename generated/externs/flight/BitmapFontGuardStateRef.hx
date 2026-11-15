package flight;

#if hl

typedef BitmapFontGuardStateRef = flight._hl.BitmapFontGuardStateRef;

#elseif cpp

typedef BitmapFontGuardStateRef = flight._cpp.BitmapFontGuardStateRef;

#elseif (js && flight_esm)

typedef BitmapFontGuardStateRef = flight._js.BitmapFontGuardStateRef;

#elseif js

#error "flight.BitmapFontGuardStateRef on js requires flight_esm."

#else

#error "flight.BitmapFontGuardStateRef: no backend for this target."

#end
