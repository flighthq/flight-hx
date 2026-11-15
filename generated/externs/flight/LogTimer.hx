package flight;

#if hl

typedef LogTimer = flight._hl.LogTimer;

#elseif cpp

typedef LogTimer = flight._cpp.LogTimer;

#elseif (js && flight_esm)

typedef LogTimer = flight._js.LogTimer;

#elseif js

#error "flight.LogTimer on js requires flight_esm."

#else

#error "flight.LogTimer: no backend for this target."

#end
