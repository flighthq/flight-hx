package flight;

#if hl

typedef Physics2DAbiContactBuffer = flight._hl.Physics2DAbiContactBuffer;

#elseif cpp

typedef Physics2DAbiContactBuffer = flight._cpp.Physics2DAbiContactBuffer;

#elseif (js && flight_esm)

typedef Physics2DAbiContactBuffer = flight._js.Physics2DAbiContactBuffer;

#elseif js

#error "flight.Physics2DAbiContactBuffer on js requires flight_esm."

#else

#error "flight.Physics2DAbiContactBuffer: no backend for this target."

#end
