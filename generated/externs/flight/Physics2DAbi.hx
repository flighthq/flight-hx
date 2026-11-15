package flight;

#if hl

typedef Physics2DAbi = flight._hl.Physics2DAbi;

#elseif cpp

typedef Physics2DAbi = flight._cpp.Physics2DAbi;

#elseif (js && flight_esm)

typedef Physics2DAbi = flight._js.Physics2DAbi;

#elseif js

#error "flight.Physics2DAbi on js requires flight_esm."

#else

#error "flight.Physics2DAbi: no backend for this target."

#end
