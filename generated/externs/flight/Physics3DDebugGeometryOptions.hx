package flight;

#if hl

typedef Physics3DDebugGeometryOptions = flight._hl.Physics3DDebugGeometryOptions;

#elseif cpp

typedef Physics3DDebugGeometryOptions = flight._cpp.Physics3DDebugGeometryOptions;

#elseif (js && flight_esm)

typedef Physics3DDebugGeometryOptions = flight._js.Physics3DDebugGeometryOptions;

#elseif js

#error "flight.Physics3DDebugGeometryOptions on js requires flight_esm."

#else

#error "flight.Physics3DDebugGeometryOptions: no backend for this target."

#end
