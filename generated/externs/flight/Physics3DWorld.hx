package flight;

#if hl

typedef Physics3DWorld = flight._hl.Physics3DWorld;

#elseif cpp

typedef Physics3DWorld = flight._cpp.Physics3DWorld;

#elseif (js && flight_esm)

typedef Physics3DWorld = flight._js.Physics3DWorld;

#elseif js

#error "flight.Physics3DWorld on js requires flight_esm."

#else

#error "flight.Physics3DWorld: no backend for this target."

#end
