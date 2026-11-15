package flight;

#if hl

typedef PackResult = flight._hl.PackResult;

#elseif cpp

typedef PackResult = flight._cpp.PackResult;

#elseif (js && flight_esm)

typedef PackResult = flight._js.PackResult;

#elseif js

#error "flight.PackResult on js requires flight_esm."

#else

#error "flight.PackResult: no backend for this target."

#end
