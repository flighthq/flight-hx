package flight;

#if hl

typedef LogState = flight._hl.LogState;

#elseif cpp

typedef LogState = flight._cpp.LogState;

#elseif (js && flight_esm)

typedef LogState = flight._js.LogState;

#elseif js

#error "flight.LogState on js requires flight_esm."

#else

#error "flight.LogState: no backend for this target."

#end
