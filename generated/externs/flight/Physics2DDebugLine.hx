package flight;

#if hl

typedef Physics2DDebugLine = flight._hl.Physics2DDebugLine;

#elseif cpp

typedef Physics2DDebugLine = flight._cpp.Physics2DDebugLine;

#elseif (js && flight_esm)

typedef Physics2DDebugLine = flight._js.Physics2DDebugLine;

#elseif js

#error "flight.Physics2DDebugLine on js requires flight_esm."

#else

#error "flight.Physics2DDebugLine: no backend for this target."

#end
