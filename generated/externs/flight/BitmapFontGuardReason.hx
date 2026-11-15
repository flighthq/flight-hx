package flight;

#if hl

typedef BitmapFontGuardReason = flight._hl.BitmapFontGuardReason;

#elseif cpp

typedef BitmapFontGuardReason = flight._cpp.BitmapFontGuardReason;

#elseif (js && flight_esm)

typedef BitmapFontGuardReason = flight._js.BitmapFontGuardReason;

#elseif js

#error "flight.BitmapFontGuardReason on js requires flight_esm."

#else

#error "flight.BitmapFontGuardReason: no backend for this target."

#end
