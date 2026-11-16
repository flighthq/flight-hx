package flight;

#if hl

typedef Physics3DDebugLine = flight._hl.Physics3DDebugLine;

#elseif cpp

typedef Physics3DDebugLine = flight._cpp.Physics3DDebugLine;

#elseif (js && flight_esm)

typedef Physics3DDebugLine = flight._js.Physics3DDebugLine;

#elseif js

#error "flight.Physics3DDebugLine on js requires flight_esm."

#else

#error "flight.Physics3DDebugLine: no backend for this target."

#end
