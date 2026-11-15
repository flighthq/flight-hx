package flight;

#if hl

typedef InputPointerData = flight._hl.InputPointerData;

#elseif cpp

typedef InputPointerData = flight._cpp.InputPointerData;

#elseif (js && flight_esm)

typedef InputPointerData = flight._js.InputPointerData;

#elseif js

#error "flight.InputPointerData on js requires flight_esm."

#else

#error "flight.InputPointerData: no backend for this target."

#end
