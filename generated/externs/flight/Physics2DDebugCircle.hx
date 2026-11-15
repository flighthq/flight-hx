package flight;

#if hl

typedef Physics2DDebugCircle = flight._hl.Physics2DDebugCircle;

#elseif cpp

typedef Physics2DDebugCircle = flight._cpp.Physics2DDebugCircle;

#elseif (js && flight_esm)

typedef Physics2DDebugCircle = flight._js.Physics2DDebugCircle;

#elseif js

#error "flight.Physics2DDebugCircle on js requires flight_esm."

#else

#error "flight.Physics2DDebugCircle: no backend for this target."

#end
