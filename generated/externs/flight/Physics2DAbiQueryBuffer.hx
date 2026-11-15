package flight;

#if hl

typedef Physics2DAbiQueryBuffer = flight._hl.Physics2DAbiQueryBuffer;

#elseif cpp

typedef Physics2DAbiQueryBuffer = flight._cpp.Physics2DAbiQueryBuffer;

#elseif (js && flight_esm)

typedef Physics2DAbiQueryBuffer = flight._js.Physics2DAbiQueryBuffer;

#elseif js

#error "flight.Physics2DAbiQueryBuffer on js requires flight_esm."

#else

#error "flight.Physics2DAbiQueryBuffer: no backend for this target."

#end
