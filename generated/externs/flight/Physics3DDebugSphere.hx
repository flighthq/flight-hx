package flight;

#if hl

typedef Physics3DDebugSphere = flight._hl.Physics3DDebugSphere;

#elseif cpp

typedef Physics3DDebugSphere = flight._cpp.Physics3DDebugSphere;

#elseif (js && flight_esm)

typedef Physics3DDebugSphere = flight._js.Physics3DDebugSphere;

#elseif js

#error "flight.Physics3DDebugSphere on js requires flight_esm."

#else

#error "flight.Physics3DDebugSphere: no backend for this target."

#end
