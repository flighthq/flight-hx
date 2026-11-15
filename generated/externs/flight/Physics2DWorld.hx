package flight;

#if hl

typedef Physics2DWorld = flight._hl.Physics2DWorld;

#elseif cpp

typedef Physics2DWorld = flight._cpp.Physics2DWorld;

#elseif (js && flight_esm)

typedef Physics2DWorld = flight._js.Physics2DWorld;

#elseif js

#error "flight.Physics2DWorld on js requires flight_esm."

#else

#error "flight.Physics2DWorld: no backend for this target."

#end
