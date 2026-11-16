package flight;

#if hl

typedef Physics3DDebugGeometry = flight._hl.Physics3DDebugGeometry;

#elseif cpp

typedef Physics3DDebugGeometry = flight._cpp.Physics3DDebugGeometry;

#elseif (js && flight_esm)

typedef Physics3DDebugGeometry = flight._js.Physics3DDebugGeometry;

#elseif js

#error "flight.Physics3DDebugGeometry on js requires flight_esm."

#else

#error "flight.Physics3DDebugGeometry: no backend for this target."

#end
