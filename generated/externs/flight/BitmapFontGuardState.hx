package flight;

#if hl

typedef BitmapFontGuardState = flight._hl.BitmapFontGuardState;

#elseif cpp

typedef BitmapFontGuardState = flight._cpp.BitmapFontGuardState;

#elseif (js && flight_esm)

typedef BitmapFontGuardState = flight._js.BitmapFontGuardState;

#elseif js

#error "flight.BitmapFontGuardState on js requires flight_esm."

#else

#error "flight.BitmapFontGuardState: no backend for this target."

#end
