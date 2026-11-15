package flight;

#if hl

typedef Physics3DAbi = flight._hl.Physics3DAbi;

#elseif cpp

typedef Physics3DAbi = flight._cpp.Physics3DAbi;

#elseif (js && flight_esm)

typedef Physics3DAbi = flight._js.Physics3DAbi;

#elseif js

#error "flight.Physics3DAbi on js requires flight_esm."

#else

#error "flight.Physics3DAbi: no backend for this target."

#end
