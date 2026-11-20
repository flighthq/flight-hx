package flight;

#if hl

typedef NetProgress = flight._hl.NetProgress;

#elseif cpp

typedef NetProgress = flight._cpp.NetProgress;

#elseif (js && flight_esm)

typedef NetProgress = flight._js.NetProgress;

#elseif js

#error "flight.NetProgress on js requires flight_esm."

#else

#error "flight.NetProgress: no backend for this target."

#end
