package flight;

#if hl

typedef ScreenQueryScratch = flight._hl.ScreenQueryScratch;

#elseif cpp

typedef ScreenQueryScratch = flight._cpp.ScreenQueryScratch;

#elseif (js && flight_esm)

typedef ScreenQueryScratch = flight._js.ScreenQueryScratch;

#elseif js

#error "flight.ScreenQueryScratch on js requires flight_esm."

#else

#error "flight.ScreenQueryScratch: no backend for this target."

#end
