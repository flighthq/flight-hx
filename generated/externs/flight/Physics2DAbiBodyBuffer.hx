package flight;

#if hl

typedef Physics2DAbiBodyBuffer = flight._hl.Physics2DAbiBodyBuffer;

#elseif cpp

typedef Physics2DAbiBodyBuffer = flight._cpp.Physics2DAbiBodyBuffer;

#elseif (js && flight_esm)

typedef Physics2DAbiBodyBuffer = flight._js.Physics2DAbiBodyBuffer;

#elseif js

#error "flight.Physics2DAbiBodyBuffer on js requires flight_esm."

#else

#error "flight.Physics2DAbiBodyBuffer: no backend for this target."

#end
