package flight;

#if hl

typedef Physics2DMassData = flight._hl.Physics2DMassData;

#elseif cpp

typedef Physics2DMassData = flight._cpp.Physics2DMassData;

#elseif (js && flight_esm)

typedef Physics2DMassData = flight._js.Physics2DMassData;

#elseif js

#error "flight.Physics2DMassData on js requires flight_esm."

#else

#error "flight.Physics2DMassData: no backend for this target."

#end
