package flight;

#if hl

typedef ScreenInfo = flight._hl.ScreenInfo;

#elseif cpp

typedef ScreenInfo = flight._cpp.ScreenInfo;

#elseif (js && flight_esm)

typedef ScreenInfo = flight._js.ScreenInfo;

#elseif js

#error "flight.ScreenInfo on js requires flight_esm."

#else

#error "flight.ScreenInfo: no backend for this target."

#end
