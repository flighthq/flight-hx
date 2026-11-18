package flight;

#if hl

typedef UnitSignal = flight._hl.UnitSignal;

#elseif cpp

typedef UnitSignal = flight._cpp.UnitSignal;

#elseif (js && flight_esm)

typedef UnitSignal = flight._js.UnitSignal;

#elseif js

#error "flight.UnitSignal on js requires flight_esm."

#else

#error "flight.UnitSignal: no backend for this target."

#end
