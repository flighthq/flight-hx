package flight;

#if hl

typedef Physics2DAbiCommandBuffer = flight._hl.Physics2DAbiCommandBuffer;

#elseif cpp

typedef Physics2DAbiCommandBuffer = flight._cpp.Physics2DAbiCommandBuffer;

#elseif (js && flight_esm)

typedef Physics2DAbiCommandBuffer = flight._js.Physics2DAbiCommandBuffer;

#elseif js

#error "flight.Physics2DAbiCommandBuffer on js requires flight_esm."

#else

#error "flight.Physics2DAbiCommandBuffer: no backend for this target."

#end
