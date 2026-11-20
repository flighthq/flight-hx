package flight;

#if hl

typedef BitmapTextGuardState = flight._hl.BitmapTextGuardState;

#elseif cpp

typedef BitmapTextGuardState = flight._cpp.BitmapTextGuardState;

#elseif (js && flight_esm)

typedef BitmapTextGuardState = flight._js.BitmapTextGuardState;

#elseif js

#error "flight.BitmapTextGuardState on js requires flight_esm."

#else

#error "flight.BitmapTextGuardState: no backend for this target."

#end
