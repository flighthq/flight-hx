package flight;

#if hl

typedef Physics2DMaterial = flight._hl.Physics2DMaterial;

#elseif cpp

typedef Physics2DMaterial = flight._cpp.Physics2DMaterial;

#elseif (js && flight_esm)

typedef Physics2DMaterial = flight._js.Physics2DMaterial;

#elseif js

#error "flight.Physics2DMaterial on js requires flight_esm."

#else

#error "flight.Physics2DMaterial: no backend for this target."

#end
